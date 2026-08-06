import '../domain/species.dart';

/// Spotted Gully Shark (Triakis megalopterus)
const spottedGullySharkSpeciesProfile = Species(
  id: 'spotted_gully_shark',

  name: 'Spotted Gully Shark',

  scientificName: 'Triakis megalopterus',

  aliases: [
    'Gully Shark',
  ],

  preferredTides: [
    'Incoming',
    'High',
  ],

  preferredWindDirections: [
    'SW',
    'S',
  ],

  minWindSpeed: 0,

  maxWindSpeed: 15,

  minSwellHeight: 0.5,

  maxSwellHeight: 1.5,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Night',

  recommendedBait: 'Fresh Chokka (Squid) or Mackerel',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '100lb Monofilament Leader',

  recommendedHookSizes: [
    '6/0',
    '8/0',
  ],

  preferredWaterColour: 'Clean to slightly discoloured water',

  preferredWaterTemperature: '14°C - 19°C',

  habitats: [
    'Rocky Gullies',
    'Kelp Beds',
    'Surf Zone Close to Reef',
  ],

  distribution: [
    'Western Cape',
    'Eastern Cape',
  ],

  seasons: [
    'Autumn',
    'Winter',
    'Spring',
  ],

  feedingBehaviour:
  'Bottom-feeding shark that hunts crabs, octopus and small reef fish over rocky gullies and kelp beds, most active after dark.',

  notes:
  'A hard-pulling but docile shark that is a popular catch-and-release target for rock and ski-boat anglers along the southern and eastern Cape coast. Blunt teeth make wire trace unnecessary, but a heavy abrasion-resistant leader is essential given the rocky terrain it favours. Handle with care and release quickly.',

  isEdible: false,
);
