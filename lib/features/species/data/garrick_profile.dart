import '../domain/entities/species_profile.dart';

/// Garrick / Leervis (Lichia amia)
///
/// Environmental profile used by the Recommendation Engine.
///
/// Values represent preferred fishing conditions and should be
/// refined over time as Neptune's evidence base grows.
const SpeciesProfile garrickProfile = SpeciesProfile(
  // Wind (km/h)
  minimumWindSpeed: 8,
  maximumWindSpeed: 22,

  // Swell (m)
  minimumSwellHeight: 0.8,
  maximumSwellHeight: 2.0,

  // Water temperature (°C)
  minimumWaterTemperature: 19,
  maximumWaterTemperature: 24,

  // Atmospheric pressure (hPa)
  minimumPressure: 1010,
  maximumPressure: 1022,

  // Preferred moon phases
  preferredMoonPhases: [
    'New',
    'Full',
  ],
);