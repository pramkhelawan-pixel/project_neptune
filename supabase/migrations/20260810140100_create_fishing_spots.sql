create table public.fishing_spots (
  id uuid primary key default gen_random_uuid(),
  province text not null,
  region text not null,
  name text not null,
  latitude numeric(8,4) not null,
  longitude numeric(8,4) not null,
  spot_type text not null,
  access_notes text,
  target_species text[] not null default '{}',
  is_mpa boolean not null default false,
  mpa_name text,
  is_no_take boolean not null default false,
  safety_flags text[] not null default '{}',
  created_at timestamptz not null default now()
);

alter table public.fishing_spots enable row level security;

create policy "Premium users can read fishing spots"
  on public.fishing_spots for select
  to authenticated
  using (
    exists (
      select 1 from public.profiles
      where profiles.id = auth.uid() and profiles.is_premium
    )
  );

-- No insert/update/delete policy for anon/authenticated - the directory is
-- maintained via migrations/seed data through service_role only.
