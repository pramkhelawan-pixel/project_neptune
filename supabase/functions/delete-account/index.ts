// Permanently deletes the calling user's Neptune account and all of their
// data. There is no client-callable "delete my own auth account" endpoint
// in Supabase Auth — only the GoTrue Admin API can do that, and it requires
// the service-role key, which must never reach the Flutter client. This
// function is the only place that key is used, and only for the caller's
// own verified id (see getUser() below) — never a client-supplied one.
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  const authHeader = req.headers.get("Authorization");

  if (!authHeader) {
    return jsonResponse({ error: "Missing Authorization header" }, 401);
  }

  // Anon-key client carrying the caller's own JWT, used only to verify who
  // is calling via getUser() -- this is the sole source of truth for the
  // account being deleted. The request body is never trusted for this.
  const callerClient = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_ANON_KEY")!,
    { global: { headers: { Authorization: authHeader } } },
  );

  const { data: userData, error: userError } = await callerClient.auth
    .getUser();

  if (userError || !userData.user) {
    return jsonResponse({ error: "Invalid or expired session" }, 401);
  }

  const userId = userData.user.id;

  // Service-role client -- used from here on, scoped to userId above only.
  const adminClient = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
  );

  // Deletion order matters: catches.session_id -> fishing_sessions.id and
  // both catches.user_id / fishing_sessions.user_id -> auth.users.id are
  // all ON DELETE NO ACTION (confirmed via pg_constraint), so child rows
  // must go before the parent, and both before the auth user itself. Only
  // profiles.id -> auth.users.id is ON DELETE CASCADE.
  const { error: catchesError } = await adminClient
    .from("catches")
    .delete()
    .eq("user_id", userId);

  if (catchesError) {
    console.error("delete-account: catches delete failed:", catchesError.message);
    return jsonResponse(
      { error: "Failed to delete account data. Please try again." },
      500,
    );
  }

  const { error: sessionsError } = await adminClient
    .from("fishing_sessions")
    .delete()
    .eq("user_id", userId);

  if (sessionsError) {
    console.error(
      "delete-account: fishing_sessions delete failed:",
      sessionsError.message,
    );
    return jsonResponse(
      { error: "Failed to delete account data. Please try again." },
      500,
    );
  }

  const { error: deleteUserError } = await adminClient.auth.admin
    .deleteUser(userId);

  if (deleteUserError) {
    console.error(
      "delete-account: auth user delete failed:",
      deleteUserError.message,
    );
    return jsonResponse(
      { error: "Failed to delete account. Please try again." },
      500,
    );
  }

  return jsonResponse({ success: true });
});
