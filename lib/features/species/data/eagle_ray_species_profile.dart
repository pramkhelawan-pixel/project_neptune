import '../domain/species.dart';

/// Eagle Ray (Myliobatis aquila)
const eagleRaySpeciesProfile = Species(
  id: 'eagle_ray',

  name: 'Eagle Ray',

  scientificName: 'Myliobatis aquila',

  aliases: [
    'Common Eagle Ray',
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

  minSwellHeight: 0.3,

  maxSwellHeight: 1.5,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Early Morning',

  recommendedBait: 'Sand Prawn or Crab',

  recommendedLure: 'Not targeted with lures',

  recommendedTrace: '60lb Monofilament Leader',

  recommendedHookSizes: [
    '4/0',
    '6/0',
  ],

  preferredWaterColour: 'Clean to slightly discoloured water',

  preferredWaterTemperature: '15°C - 21°C',

  habitats: [
    'Sandy Bays',
    'Surf Gutters',
    'Shallow Reef Margins',
  ],

  distribution: [
    'Western Cape',
    'Eastern Cape',
  ],

  seasons: [
    'Spring',
    'Summer',
  ],

  feedingBehaviour:
  'Patrols close to the sand in search of buried molluscs and crustaceans, which it crushes with flattened plate-like teeth.',

  notes:
  'Known for fast, powerful surface runs when hooked and occasional leaps, making it a lively catch-and-release target for surf anglers. Like other rays it carries a venomous tail spine, so careful handling and a de-hooking tool are essential.',

  isEdible: false,
);
