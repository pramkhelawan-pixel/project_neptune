import '../domain/entities/species_profile.dart';

const SpeciesProfile galjoenProfile = SpeciesProfile(
  minimumWindSpeed: 10,
  maximumWindSpeed: 25,

  minimumSwellHeight: 1.2,
  maximumSwellHeight: 3.0,

  minimumWaterTemperature: 13,
  maximumWaterTemperature: 19,

  minimumPressure: 1008,
  maximumPressure: 1025,

  preferredMoonPhases: [
    'New',
    'First Quarter',
    'Full',
  ],
);