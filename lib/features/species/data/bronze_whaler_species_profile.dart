import '../domain/species.dart';

/// Bronze Whaler Shark (Carcharhinus brachyurus)
const bronzeWhalerSpeciesProfile = Species(
  id: 'bronze_whaler',

  name: 'Bronze Whaler',

  scientificName: 'Carcharhinus brachyurus',

  aliases: [
    'Copper Shark',
  ],

  preferredTides: [
    'Incoming',
    'High',
  ],

  preferredWindDirections: [
    'NE',
    'SW',
  ],

  minWindSpeed: 0,

  maxWindSpeed: 20,

  minSwellHeight: 0.5,

  maxSwellHeight: 2.0,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Dawn and Dusk',

  recommendedBait: 'Fresh Mullet or Mackerel',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '150lb Wire Trace',

  recommendedHookSizes: [
    '8/0',
    '10/0',
  ],

  preferredWaterColour: 'Clean to slightly discoloured water',

  preferredWaterTemperature: '16°C - 22°C',

  habitats: [
    'Surf Zone',
    'Estuary Mouths',
    'Sandy Bays',
  ],

  distribution: [
    'Western Cape',
    'Eastern Cape',
    'KwaZulu-Natal',
  ],

  seasons: [
    'Spring',
    'Summer',
    'Autumn',
  ],

  feedingBehaviour:
  'An aggressive, fast-swimming predator that hunts fish and squid close inshore, often moving into the surf zone and estuary mouths when bait fish shoals are present.',

  notes:
  'One of the most commonly encountered sharks along the South African coast and a favourite big-bait, catch-and-release target for surf and estuary anglers. Sharp teeth make a wire trace essential. Fights hard with long, powerful runs.',

  isEdible: false,
);
