// Integration tests for the delete-account Edge Function.
//
// Importing "./index.ts" below runs its top-level Deno.serve(...) call,
// starting the function locally; these tests then hit it over real HTTP
// against the local Supabase stack.
//
// NOT runnable in this environment — the Supabase CLI and Docker aren't
// installed here. To run once they are, on a machine that has them:
//   1. supabase start
//   2. supabase status   (copy "API URL", "anon key", "service_role key")
//   3. SUPABASE_URL=<API URL> SUPABASE_ANON_KEY=<anon key> \
//        SUPABASE_SERVICE_ROLE_KEY=<service_role key> \
//        deno test --allow-net --allow-env \
//        supabase/functions/delete-account/index.test.ts
// "Written" and "passing" are separate claims until that's done.
import {
  assertEquals,
  assertExists,
} from "https://deno.land/std@0.224.0/assert/mod.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
const ANON_KEY = Deno.env.get("SUPABASE_ANON_KEY");
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

if (!SUPABASE_URL || !ANON_KEY || !SERVICE_ROLE_KEY) {
  throw new Error(
    "SUPABASE_URL, SUPABASE_ANON_KEY, and SUPABASE_SERVICE_ROLE_KEY must be " +
      "set — see the instructions at the top of this file.",
  );
}

const FUNCTION_URL = "http://127.0.0.1:8000/delete-account";

async function createThrowawayUser(): Promise<
  { userId: string; accessToken: string }
> {
  const admin = createClient(SUPABASE_URL!, SERVICE_ROLE_KEY!);
  const email = `delete-account-test-${crypto.randomUUID()}@example.com`;
  const password = "TestPass123";

  const { data: created, error: createError } = await admin.auth.admin
    .createUser({ email, password, email_confirm: true });

  if (createError || !created.user) {
    throw new Error(`failed to create throwaway user: ${createError?.message}`);
  }

  const anon = createClient(SUPABASE_URL!, ANON_KEY!);
  const { data: signedIn, error: signInError } = await anon.auth
    .signInWithPassword({ email, password });

  if (signInError || !signedIn.session) {
    throw new Error(`failed to sign in throwaway user: ${signInError?.message}`);
  }

  return {
    userId: created.user.id,
    accessToken: signedIn.session.access_token,
  };
}

function callFunction(accessToken?: string): Promise<Response> {
  return fetch(FUNCTION_URL, {
    method: "POST",
    headers: accessToken ? { Authorization: `Bearer ${accessToken}` } : {},
  });
}

// Starts the function under test.
import "./index.ts";

Deno.test("missing Authorization header -> 401", async () => {
  const response = await callFunction();
  assertEquals(response.status, 401);

  const body = await response.json();
  assertExists(body.error);
});

Deno.test("invalid/garbage token -> 401", async () => {
  const response = await callFunction("not-a-real-token");
  assertEquals(response.status, 401);

  const body = await response.json();
  assertExists(body.error);
});

Deno.test(
  "valid caller with no data -> deletes auth user + cascaded profile",
  async () => {
    const { userId, accessToken } = await createThrowawayUser();
    const admin = createClient(SUPABASE_URL!, SERVICE_ROLE_KEY!);

    const response = await callFunction(accessToken);
    assertEquals(response.status, 200);

    const body = await response.json();
    assertEquals(body.success, true);

    const { data: authUser } = await admin.auth.admin.getUserById(userId);
    assertEquals(authUser.user, null);

    const { data: profileRow } = await admin
      .from("profiles")
      .select("id")
      .eq("id", userId)
      .maybeSingle();
    assertEquals(profileRow, null);
  },
);

Deno.test(
  "valid caller with a session + catch -> both removed before the auth user",
  async () => {
    const { userId, accessToken } = await createThrowawayUser();
    const admin = createClient(SUPABASE_URL!, SERVICE_ROLE_KEY!);

    const { data: session, error: sessionError } = await admin
      .from("fishing_sessions")
      .insert({ user_id: userId, location: "Test Spot" })
      .select("id")
      .single();
    assertEquals(sessionError, null);

    const { error: catchError } = await admin.from("catches").insert({
      user_id: userId,
      session_id: session!.id,
      species: "Test Species",
      location: "Test Spot",
    });
    assertEquals(catchError, null);

    const response = await callFunction(accessToken);
    assertEquals(response.status, 200);

    const { data: sessions } = await admin
      .from("fishing_sessions")
      .select("id")
      .eq("user_id", userId);
    assertEquals(sessions?.length, 0);

    const { data: catches } = await admin
      .from("catches")
      .select("id")
      .eq("user_id", userId);
    assertEquals(catches?.length, 0);

    const { data: authUser } = await admin.auth.admin.getUserById(userId);
    assertEquals(authUser.user, null);
  },
);

Deno.test("caller cannot delete a different user by any request payload", async () => {
  const victim = await createThrowawayUser();
  const attacker = await createThrowawayUser();

  // Even if an attacker tries to smuggle a target id in the body, the
  // function never reads the body for this -- only the verified JWT.
  const response = await fetch(FUNCTION_URL, {
    method: "POST",
    headers: {
      Authorization: `Bearer ${attacker.accessToken}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ userId: victim.userId }),
  });
  assertEquals(response.status, 200);

  const admin = createClient(SUPABASE_URL!, SERVICE_ROLE_KEY!);

  // The victim must still exist -- only the attacker's own account was
  // deleted.
  const { data: victimUser } = await admin.auth.admin.getUserById(
    victim.userId,
  );
  assertExists(victimUser.user);

  const { data: attackerUser } = await admin.auth.admin.getUserById(
    attacker.userId,
  );
  assertEquals(attackerUser.user, null);
});
