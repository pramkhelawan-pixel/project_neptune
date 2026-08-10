-- Minimal premium-entitlement table. No billing/subscription lifecycle yet -
-- is_premium is flipped manually (Studio, or a future billing webhook) via
-- service_role. Clients can read their own row but never write is_premium
-- themselves.

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  is_premium boolean not null default false,
  created_at timestamptz not null default now()
);

-- Auto-create a profile row when a new user signs up, so every
-- authenticated user has exactly one row to check against.
create function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id) values (new.id);
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

alter table public.profiles enable row level security;

create policy "Users can read own profile"
  on public.profiles for select
  to authenticated
  using (auth.uid() = id);

-- Deliberately no insert/update/delete policy for anon/authenticated -
-- is_premium can only be changed via service_role.
