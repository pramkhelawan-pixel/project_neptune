-- Backfill profiles rows for auth.users accounts that predate the
-- handle_new_user() trigger (20260810140000_create_profiles.sql). The
-- trigger only fires on new auth.users inserts going forward, so every
-- account created before it was applied has no profiles row and therefore
-- fails the fishing_spots RLS check regardless of intended premium status.
insert into public.profiles (id)
select u.id
from auth.users u
left join public.profiles p on p.id = u.id
where p.id is null;
