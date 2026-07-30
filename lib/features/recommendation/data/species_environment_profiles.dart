import '../domain/species_environment_profile.dart';

const shadEnvironmentProfile = SpeciesEnvironmentProfile(
  species: 'Shad',

  minimumWaterTemperature: 18.0,
  maximumWaterTemperature: 22.0,

  minimumSwellHeight: 0.8,
  maximumSwellHeight: 1.5,

  preferredTides: [
    'Incoming',
    'Push',
    'High',
  ],

  preferredWindDirections: [
    'SW',
    'South West',
    'W',
  ],

  preferredMoonPhases: [
    'New',
    'Full',
  ],
);

const kobEnvironmentProfile = SpeciesEnvironmentProfile(
  species: 'Dusky Kob',

  minimumWaterTemperature: 17.0,
  maximumWaterTemperature: 22.0,

  minimumSwellHeight: 1.0,
  maximumSwellHeight: 2.2,

  preferredTides: [
    'Incoming',
    'High',
  ],

  preferredWindDirections: [
    'SW',
    'S',
    'W',
  ],

  preferredMoonPhases: [
    'New',
    'First Quarter',
    'Full',
  ],
);

const environmentProfiles = <SpeciesEnvironmentProfile>[
  shadEnvironmentProfile,
  kobEnvironmentProfile,
];