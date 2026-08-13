-- Location selection is no longer a premium-only feature: all signed-in
-- users can now browse and select from the fishing spot directory, not
-- just premium ones. The previous policy restricted SELECT to
-- profiles.is_premium = true; this replaces it with a plain
-- authenticated-role check. The directory data itself is unchanged.
drop policy "Premium users can read fishing spots" on public.fishing_spots;

create policy "Authenticated users can read fishing spots"
  on public.fishing_spots for select
  to authenticated
  using (true);

-- Still no insert/update/delete policy for anon/authenticated - the
-- directory is maintained via migrations/seed data through service_role
-- only.
