import '../domain/species.dart';

/// Zebra (Diplodus cervinus hottentotus)
const zebraSpeciesProfile = Species(
  id: 'zebra',

  name: 'Zebra',

  scientificName: 'Diplodus cervinus hottentotus',

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

  maxWindSpeed: 18,

  minSwellHeight: 0.8,

  maxSwellHeight: 2.0,

  preferredMoonPhases: [
    'New',
    'First Quarter',
    'Full',
  ],

  preferredTime: 'Early Morning',

  recommendedBait: 'Red Bait',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '30lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '2/0',
    '4/0',
  ],

  preferredWaterColour: 'Clean water over reef',

  preferredWaterTemperature: '16°C - 21°C',

  habitats: [
    'Reef Ledges',
    'Deep Gullies',
  ],

  distribution: [
    'Eastern Cape',
    'Western Cape',
    'KwaZulu-Natal',
  ],

  seasons: [
    'Winter',
    'Spring',
  ],

  feedingBehaviour:
  'Feeds close to reef structure and ledges on mussel, red bait and small crustaceans.',

  notes:
  'Found in deeper, more structure-rich water than Blacktail. Moderate to strong tackle is recommended to control fish away from reef.',
);
