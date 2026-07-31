import '../domain/entities/species_profile.dart';

/// Garrick / Leervis (Lichia amia)
const SpeciesProfile garrickProfile = SpeciesProfile(
  minimumWindSpeed: 8,
  maximumWindSpeed: 22,

  minimumSwellHeight: 0.8,
  maximumSwellHeight: 2.0,

  minimumWaterTemperature: 19,
  maximumWaterTemperature: 24,

  minimumPressure: 1010,
  maximumPressure: 1022,

  preferredMoonPhases: [
    'New',
    'Full',
  ],
);