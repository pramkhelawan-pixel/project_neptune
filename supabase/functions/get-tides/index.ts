// Sits between the Flutter app and WorldTides. Flutter must never call
// WorldTides directly — see docs/planning/tide_caching_spec.md.
//
// Cache freshness is governed by tide_cache.expires_at (12h TTL), not by
// calendar date — the request hash deliberately excludes date so it doesn't
// fragment at midnight for no benefit. To make that TTL safe regardless of
// what time of day a row was written, WorldTides is always asked for an
// explicit date/days window here rather than relying on its undocumented
// "now-relative" default.
import { createClient } from "npm:@supabase/supabase-js@2";

const CACHE_TTL_HOURS = 12;
const COORDINATE_PRECISION = 2; // ~1.1km grid
const WORLDTIDES_TIMEOUT_MS = 10_000;
const WORLDTIDES_DAYS = 2;

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

interface TideCacheRow {
  tide_data: unknown;
  last_updated: string;
  expires_at: string;
}

type WorldTidesResult =
  | { ok: true; data: Record<string, unknown> }
  | { ok: false; reason: string };

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

async function sha256Hex(input: string): Promise<string> {
  const digest = await crypto.subtle.digest(
    "SHA-256",
    new TextEncoder().encode(input),
  );
  return Array.from(new Uint8Array(digest))
    .map((byte) => byte.toString(16).padStart(2, "0"))
    .join("");
}

function roundCoordinate(value: number): number {
  const factor = 10 ** COORDINATE_PRECISION;
  return Math.round(value * factor) / factor;
}

async function fetchWorldTides(
  latitude: number,
  longitude: number,
): Promise<WorldTidesResult> {
  const apiKey = Deno.env.get("WORLDTIDES_API_KEY");

  if (!apiKey) {
    return { ok: false, reason: "WORLDTIDES_API_KEY is not configured" };
  }

  const todayIso = new Date().toISOString().slice(0, 10); // YYYY-MM-DD, UTC

  const url = new URL("https://www.worldtides.info/api/v3");
  url.searchParams.set("heights", "");
  url.searchParams.set("extremes", "");
  url.searchParams.set("lat", String(latitude));
  url.searchParams.set("lon", String(longitude));
  url.searchParams.set("date", todayIso);
  url.searchParams.set("days", String(WORLDTIDES_DAYS));
  url.searchParams.set("key", apiKey);

  const controller = new AbortController();
  const timeout = setTimeout(
    () => controller.abort(),
    WORLDTIDES_TIMEOUT_MS,
  );

  try {
    const response = await fetch(url, { signal: controller.signal });

    if (!response.ok) {
      return { ok: false, reason: `WorldTides HTTP ${response.status}` };
    }

    const body = await response.json();

    // WorldTides can return HTTP 200 with a business-level error in the body
    // (bad key, quota exceeded, invalid coordinates) — must not cache these.
    if (body.status !== 200) {
      return {
        ok: false,
        reason:
          `WorldTides returned status ${body.status}: ${body.error ?? "unknown error"}`,
      };
    }

    return { ok: true, data: body };
  } catch (error) {
    return {
      ok: false,
      reason: error instanceof Error ? error.message : "WorldTides fetch failed",
    };
  } finally {
    clearTimeout(timeout);
  }
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  let latitude: number;
  let longitude: number;
  let locationName: string | null;

  try {
    const body = await req.json();
    latitude = Number(body.latitude);
    longitude = Number(body.longitude);
    locationName = typeof body.locationName === "string"
      ? body.locationName
      : null;

    if (!Number.isFinite(latitude) || !Number.isFinite(longitude)) {
      throw new Error("latitude/longitude must be finite numbers");
    }
  } catch (error) {
    return jsonResponse(
      {
        error: `Invalid request body: ${
          error instanceof Error ? error.message : String(error)
        }`,
      },
      400,
    );
  }

  const roundedLat = roundCoordinate(latitude);
  const roundedLon = roundCoordinate(longitude);
  const requestHash = await sha256Hex(`${roundedLat}:${roundedLon}`);

  // Uses the service-role key, not the caller's forwarded JWT — with RLS
  // enabled and zero policies on tide_cache, forwarding the caller's JWT
  // here would make every query look like "no cache," forever.
  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
  );

  const nowIso = new Date().toISOString();

  // Freshness compared in the query itself, not against a JS Date, to avoid
  // clock skew between the edge runtime and Postgres.
  const { data: freshRow, error: freshLookupError } = await supabase
    .from("tide_cache")
    .select("tide_data, last_updated, expires_at")
    .eq("request_hash", requestHash)
    .gt("expires_at", nowIso)
    .maybeSingle();

  if (freshLookupError) {
    console.error("tide_cache fresh lookup failed", freshLookupError);
  }

  const freshCacheRow = freshRow as TideCacheRow | null;

  if (freshCacheRow) {
    console.log(`cache hit for ${requestHash}`);
    return jsonResponse({
      data: freshCacheRow.tide_data,
      source: "cache",
      warning: null,
      last_updated: freshCacheRow.last_updated,
    });
  }

  console.log(`cache miss for ${requestHash}, fetching WorldTides`);
  const worldTidesResult = await fetchWorldTides(roundedLat, roundedLon);

  if (worldTidesResult.ok) {
    const expiresAt = new Date(
      Date.now() + CACHE_TTL_HOURS * 60 * 60 * 1000,
    ).toISOString();

    const { error: upsertError } = await supabase.from("tide_cache").upsert(
      {
        location_name: locationName,
        latitude: roundedLat,
        longitude: roundedLon,
        request_hash: requestHash,
        tide_data: worldTidesResult.data,
        last_updated: nowIso,
        expires_at: expiresAt,
      },
      { onConflict: "request_hash" },
    );

    if (upsertError) {
      // A write hiccup shouldn't fail an otherwise-good fetch.
      console.error("tide_cache upsert failed", upsertError);
    }

    return jsonResponse({
      data: worldTidesResult.data,
      source: "fresh",
      warning: null,
      last_updated: nowIso,
    });
  }

  console.error(
    `WorldTides unavailable for ${requestHash}: ${worldTidesResult.reason}`,
  );

  // WorldTides failed — fall back to any existing row, even if expired,
  // rather than failing the request outright.
  const { data: staleRow, error: staleLookupError } = await supabase
    .from("tide_cache")
    .select("tide_data, last_updated, expires_at")
    .eq("request_hash", requestHash)
    .maybeSingle();

  if (staleLookupError) {
    console.error("tide_cache stale lookup failed", staleLookupError);
  }

  const staleCacheRow = staleRow as TideCacheRow | null;

  if (staleCacheRow) {
    console.log(`serving stale fallback for ${requestHash}`);
    return jsonResponse({
      data: staleCacheRow.tide_data,
      source: "stale_fallback",
      warning:
        `WorldTides unavailable; showing tide data last updated ${staleCacheRow.last_updated}`,
      last_updated: staleCacheRow.last_updated,
    });
  }

  return jsonResponse({ error: "Tide data temporarily unavailable" }, 503);
});
