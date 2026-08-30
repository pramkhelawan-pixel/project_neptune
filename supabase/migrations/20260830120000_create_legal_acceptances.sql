-- Records that a user explicitly accepted the Terms & Conditions and
-- Privacy Policy at signup. One row per user, written once, immutable.

create table public.legal_acceptances (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  terms_version text not null,
  privacy_version text not null,
  accepted_at timestamptz not null default now()
);

alter table public.legal_acceptances enable row level security;

create policy "Users can view their own legal acceptance"
  on public.legal_acceptances for select
  to authenticated
  using (auth.uid() = user_id);

-- Deliberately no insert/update/delete policy for anon/authenticated:
-- rows are written only by handle_new_user() below (security definer),
-- at signup time, and are never modified afterward.

-- Extend the existing signup trigger function to also record legal
-- acceptance in the same transaction as the auth user and profile row.
-- This must happen here rather than as a separate client-side insert:
-- if email confirmation is enabled, the client has no authenticated
-- session (no auth.uid()) at the moment signUp() returns, so it could
-- not itself satisfy an RLS-scoped insert into this table. Doing it
-- inside the trigger that already creates the profile row works
-- regardless of email-confirmation settings, and means there is no
-- window where an account can exist without a recorded acceptance --
-- if this insert fails, the whole signup transaction (including the
-- auth.users row itself) rolls back, so there is no partial-success
-- state for the client to handle.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id) values (new.id);

  insert into public.legal_acceptances (user_id, terms_version, privacy_version)
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'terms_version', '1.0'),
    coalesce(new.raw_user_meta_data ->> 'privacy_version', '1.0')
  );

  return new;
end;
$$;
