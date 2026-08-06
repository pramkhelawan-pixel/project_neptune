import '../domain/species.dart';

/// Blacktail (Diplodus capensis)
const blacktailSpeciesProfile = Species(
  id: 'blacktail',

  name: 'Blacktail',

  scientificName: 'Diplodus capensis',

  aliases: [
    'Dassie',
  ],

  preferredTides: [
    'Low',
    'Incoming',
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
    'First Quarter',
    'Full',
  ],

  preferredTime: 'Early Morning',

  recommendedBait: 'Red Bait',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '20lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '4',
    '2',
  ],

  preferredWaterColour: 'Clean, washing water',

  preferredWaterTemperature: '16°C - 21°C',

  habitats: [
    'Rocky Gullies',
    'Reef Edges',
    'Washing Water Close to Rocks',
  ],

  distribution: [
    'KwaZulu-Natal',
    'Eastern Cape',
    'Western Cape',
  ],

  seasons: [
    'Winter',
    'Spring',
  ],

  feedingBehaviour:
  'A cautious, small-mouthed grazer that feeds on mussel, redbait and small invertebrates dislodged by wave wash close to rock and reef.',

  notes:
  'Notoriously bait-shy. Light tackle, small hooks and a stealthy approach close to washing water generally produce the best results.',
);
