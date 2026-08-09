-- Catch logging must succeed even when marine conditions can't be fetched
-- (e.g. WorldTides outage) — see log_catch_controller.dart best-effort fetch.
-- tide_state, next_high_tide, next_low_tide are already nullable.
alter table fishing_sessions
  alter column wind_speed drop not null,
  alter column wind_direction drop not null,
  alter column swell_height drop not null,
  alter column swell_period drop not null,
  alter column water_temperature drop not null,
  alter column air_temperature drop not null,
  alter column atmospheric_pressure drop not null,
  alter column tide_height drop not null,
  alter column moon_phase drop not null,
  alter column sunrise drop not null,
  alter column sunset drop not null;
