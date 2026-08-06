import '../domain/species.dart';

/// Galjoen (Dichistius capensis)
const galjoenSpeciesProfile = Species(
  id: 'galjoen',

  name: 'Galjoen',

  scientificName: 'Dichistius capensis',

  preferredTides: [
    'Incoming',
    'High',
  ],

  preferredWindDirections: [
    'SW',
    'S',
    'W',
  ],

  minWindSpeed: 10,

  maxWindSpeed: 25,

  minSwellHeight: 1.2,

  maxSwellHeight: 3.0,

  preferredMoonPhases: [
    'New',
    'First Quarter',
    'Full',
  ],

  preferredTime: 'Daytime',

  recommendedBait: 'Red Bait',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '25lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '1',
    '2',
  ],

  preferredWaterColour: 'Turbulent, white water',

  preferredWaterTemperature: '13°C - 19°C',

  habitats: [
    'Rocky Surf Zones',
    'Wave-Washed Gullies',
    'White Water',
  ],

  distribution: [
    'Western Cape',
    'Eastern Cape',
    'KwaZulu-Natal',
  ],

  seasons: [
    'Autumn',
    'Winter',
    'Spring',
  ],

  feedingBehaviour:
  'Feeds actively in turbulent, wave-washed white water on red bait, mussel and sea lice dislodged by wave action.',

  notes:
  'South Africa\'s national fish. Best targeted in rough, turbulent surf conditions rather than calm clean water, often most productive directly after a cold front.',
);
