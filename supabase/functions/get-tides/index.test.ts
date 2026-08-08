// Integration tests for the get-tides Edge Function.
//
// Importing "./index.ts" below runs its top-level Deno.serve(...) call,
// starting the function locally; these tests then hit it over real HTTP.
// Only the WorldTides call is intercepted (see stubWorldTides) — every
// other fetch (the function's own Supabase/Postgres calls) passes through
// untouched to the real local stack, so this needs an actual database
// to talk to.
//
// NOT runnable in this environment — the Supabase CLI and Docker aren't
// installed here. To run once they are, on a machine that has them:
//   1. supabase start
//   2. supabase status   (copy "API URL" and "service_role key")
//   3. SUPABASE_URL=<API URL> SUPABASE_SERVICE_ROLE_KEY=<service_role key> \
//        deno test --allow-net --allow-env \
//        supabase/functions/get-tides/index.test.ts
// "Written" and "passing" are separate claims until that's done.
import {
  assertEquals,
  assertExists,
} from "https://deno.land/std@0.224.0/assert/mod.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

if (!SUPABASE_URL || !SERVICE_ROLE_KEY) {
  throw new Error(
    "SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY must be set — see the " +
      "instructions at the top of this file (supabase start / supabase status).",
  );
}

const FUNCTION_URL = "http://127.0.0.1:8000/get-tides";
const TEST_LAT = -33.9;
const TEST_LON = 18.4;

function worldTidesSuccessBody() {
  return {
    status: 200,
    station: "Test Station",
    heights: [
      { dt: 1000, date: "2026-08-08T00:00:00.000Z", height: 1.1 },
    ],
    extremes: [
      {
        dt: 2000,
        date: "2026-08-08T06:00:00.000Z",
        height: 1.8,
        type: "High",
      },
    ],
  };
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

// Intercepts only requests to WorldTides; every other fetch (the function's
// own calls to the local Postgres/PostgREST stack) passes straight through.
function stubWorldTides(
  responder: (url: URL) => Response | Promise<Response>,
): () => void {
  const realFetch = globalThis.fetch;

  globalThis.fetch = ((input: RequestInfo | URL, init?: RequestInit) => {
    const url = new URL(
      input instanceof Request ? input.url : input.toString(),
    );

    if (url.hostname === "www.worldtides.info") {
      return Promise.resolve(responder(url));
    }

    return realFetch(input as RequestInfo, init);
  }) as typeof fetch;

  return () => {
    globalThis.fetch = realFetch;
  };
}

async function resetCacheRow(
  supabase: ReturnType<typeof createClient>,
): Promise<string> {
  const requestHash = await sha256Hex(`${TEST_LAT}:${TEST_LON}`);
  await supabase.from("tide_cache").delete().eq("request_hash", requestHash);
  return requestHash;
}

function callFunction(): Promise<Response> {
  return fetch(FUNCTION_URL, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ latitude: TEST_LAT, longitude: TEST_LON }),
  });
}

// Starts the function under test.
import "./index.ts";

Deno.test(
  "cache miss -> WorldTides success -> upserts and returns fresh data",
  async () => {
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);
    const requestHash = await resetCacheRow(supabase);

    const restore = stubWorldTides(() =>
      new Response(JSON.stringify(worldTidesSuccessBody()), { status: 200 })
    );

    try {
      const response = await callFunction();
      assertEquals(response.status, 200);

      const body = await response.json();
      assertEquals(body.source, "fresh");
      assertEquals(body.data.status, 200);
      assertEquals(body.warning, null);

      const { data: row } = await supabase
        .from("tide_cache")
        .select("request_hash, tide_data")
        .eq("request_hash", requestHash)
        .maybeSingle();
      assertExists(row, "expected the fresh fetch to have been cached");
    } finally {
      restore();
    }
  },
);

Deno.test(
  "cache hit -> returns cached data without calling WorldTides",
  async () => {
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);
    const requestHash = await resetCacheRow(supabase);

    await supabase.from("tide_cache").insert({
      latitude: TEST_LAT,
      longitude: TEST_LON,
      request_hash: requestHash,
      tide_data: worldTidesSuccessBody(),
      last_updated: new Date().toISOString(),
      expires_at: new Date(Date.now() + 60 * 60 * 1000).toISOString(),
    });

    let worldTidesCalled = false;
    const restore = stubWorldTides(() => {
      worldTidesCalled = true;
      return new Response(JSON.stringify(worldTidesSuccessBody()), {
        status: 200,
      });
    });

    try {
      const response = await callFunction();
      assertEquals(response.status, 200);

      const body = await response.json();
      assertEquals(body.source, "cache");
      assertEquals(worldTidesCalled, false);
    } finally {
      restore();
    }
  },
);

Deno.test(
  "cache miss -> WorldTides down -> existing stale row -> stale_fallback",
  async () => {
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);
    const requestHash = await resetCacheRow(supabase);

    await supabase.from("tide_cache").insert({
      latitude: TEST_LAT,
      longitude: TEST_LON,
      request_hash: requestHash,
      tide_data: worldTidesSuccessBody(),
      last_updated: new Date(Date.now() - 13 * 60 * 60 * 1000).toISOString(),
      expires_at: new Date(Date.now() - 60 * 60 * 1000).toISOString(),
    });

    const restore = stubWorldTides(() =>
      new Response("Service Unavailable", { status: 503 })
    );

    try {
      const response = await callFunction();
      assertEquals(response.status, 200);

      const body = await response.json();
      assertEquals(body.source, "stale_fallback");
      assertExists(body.warning);
    } finally {
      restore();
    }
  },
);

Deno.test(
  "cache miss -> WorldTides down -> no row at all -> 503",
  async () => {
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);
    await resetCacheRow(supabase);

    const restore = stubWorldTides(() =>
      new Response("Service Unavailable", { status: 503 })
    );

    try {
      const response = await callFunction();
      assertEquals(response.status, 503);

      const body = await response.json();
      assertExists(body.error);
    } finally {
      restore();
    }
  },
);
