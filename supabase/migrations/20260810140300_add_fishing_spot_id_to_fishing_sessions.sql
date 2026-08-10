alter table public.fishing_sessions
  add column fishing_spot_id uuid references public.fishing_spots(id);

create index fishing_sessions_fishing_spot_id_idx
  on public.fishing_sessions (fishing_spot_id);
