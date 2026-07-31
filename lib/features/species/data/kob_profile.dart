import '../domain/entities/species_profile.dart';

/// South African Kob (Argyrosomus japonicus)
///
/// Initial profile based on commonly accepted surf angling knowledge.
/// Future versions will be refined using historical Neptune catch data.
const SpeciesProfile kobProfile = SpeciesProfile(
  minimumWindSpeed: 5,
  maximumWindSpeed: 18,

  minimumSwellHeight: 1.0,
  maximumSwellHeight: 2.2,

  minimumWaterTemperature: 18,
  maximumWaterTemperature: 22,

  minimumPressure: 1012,
  maximumPressure: 1022,

  preferredMoonPhases: [
    'New',
    'First Quarter',
  ],
);