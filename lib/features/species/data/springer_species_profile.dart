import '../domain/species.dart';

/// Springer (Elops machnata)
const springerSpeciesProfile = Species(
  id: 'springer',

  name: 'Springer',

  scientificName: 'Elops machnata',

  preferredTides: [
    'Incoming',
    'High',
  ],

  preferredWindDirections: [
    'NE',
    'E',
  ],

  minWindSpeed: 0,

  maxWindSpeed: 18,

  minSwellHeight: 0.5,

  maxSwellHeight: 1.5,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Early Morning',

  recommendedBait: 'Live Prawn',

  recommendedLure: 'Small Silver Spoon',

  recommendedTrace: '20lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '1/0',
    '2/0',
  ],

  preferredWaterColour: 'Clean water',

  preferredWaterTemperature: '20°C - 26°C',

  habitats: [
    'Estuaries',
    'Estuary Mouths',
    'Surf Zone Near River Mouths',
  ],

  distribution: [
    'KwaZulu-Natal',
    'Eastern Cape',
  ],

  seasons: [
    'Summer',
    'Autumn',
  ],

  feedingBehaviour:
  'A fast-moving predator that hunts small baitfish and prawns near the surface, often around estuary mouths.',

  notes:
  'Known for spectacular jumping runs when hooked. Light tackle and small, fast-retrieved lures or live prawn produce good results.',
);
