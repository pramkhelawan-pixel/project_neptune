import '../domain/species.dart';

/// Karanteen (Sarpa salpa)
const karanteenSpeciesProfile = Species(
  id: 'karanteen',

  name: 'Karanteen',

  scientificName: 'Sarpa salpa',

  preferredTides: [
    'Incoming',
    'High',
  ],

  preferredWindDirections: [
    'SW',
    'S',
    'W',
  ],

  minWindSpeed: 0,

  maxWindSpeed: 15,

  minSwellHeight: 0.5,

  maxSwellHeight: 1.5,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Daytime',

  recommendedBait: 'White Bread',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '15lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '4',
    '2',
  ],

  preferredWaterColour: 'Clean water over reef',

  preferredWaterTemperature: '17°C - 23°C',

  habitats: [
    'Reef',
    'Rocky Gullies',
    'Harbour Walls',
  ],

  distribution: [
    'KwaZulu-Natal',
    'Eastern Cape',
    'Western Cape',
  ],

  seasons: [
    'Spring',
    'Summer',
    'Autumn',
  ],

  feedingBehaviour:
  'A shoaling grazer feeding mainly on algae and small invertebrates around reef and rocky structure.',

  notes:
  'Frequently targeted specifically to catch live bait for Garrick and Kob, in addition to being a light-tackle target in its own right.',
);
