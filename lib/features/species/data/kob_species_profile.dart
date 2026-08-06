import '../domain/species.dart';

/// Dusky Kob (Argyrosomus japonicus)
const kobSpeciesProfile = Species(
  id: 'kob',

  name: 'Kob',

  scientificName: 'Argyrosomus japonicus',

  aliases: [
    'Dusky Kob',
    'Kabeljou',
  ],

  preferredTides: [
    'Incoming',
    'High',
  ],

  preferredWindDirections: [
    'SW',
    'S',
    'W',
  ],

  minWindSpeed: 5,

  maxWindSpeed: 18,

  minSwellHeight: 1.0,

  maxSwellHeight: 2.2,

  preferredMoonPhases: [
    'New',
    'First Quarter',
    'Full',
  ],

  preferredTime: 'Night',

  recommendedBait: 'Live Mullet',

  recommendedLure: 'Paddle-Tail Soft Plastic',

  recommendedTrace: '50lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '6/0',
    '8/0',
  ],

  preferredWaterColour: 'Slightly discoloured, moving water',

  preferredWaterTemperature: '18°C - 22°C',

  habitats: [
    'Surf Gutters',
    'Estuaries',
    'Deeper Coastal Channels',
  ],

  distribution: [
    'KwaZulu-Natal',
    'Eastern Cape',
    'Western Cape',
  ],

  seasons: [
    'Summer',
    'Autumn',
    'Winter',
    'Spring',
  ],

  feedingBehaviour:
  'Feeds primarily on baitfish, squid and crustaceans, often most active after dark and during periods of increased water movement.',

  notes:
  'One of South Africa\'s most sought-after surf species. Larger fish are typically caught at night in gutters with good water movement.',
);
