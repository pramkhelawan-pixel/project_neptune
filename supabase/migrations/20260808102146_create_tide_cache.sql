-- Server-side cache for WorldTides responses, fetched via the get-tides Edge Function.
-- The Flutter app never queries this table directly; only the Edge Function
-- (using the service_role key) reads/writes it.

create table public.tide_cache (
  id uuid primary key default gen_random_uuid(),
  location_name text,
  latitude numeric(8,4) not null,
  longitude numeric(8,4) not null,
  request_hash text not null unique,
  tide_data jsonb not null,
  last_updated timestamptz not null default now(),
  expires_at timestamptz not null,
  created_at timestamptz not null default now()
);

create index tide_cache_expires_at_idx on public.tide_cache (expires_at);

alter table public.tide_cache enable row level security;
-- No policies: anon/authenticated roles get zero access by default.
-- Only service_role (used internally by the Edge Function) bypasses RLS.
