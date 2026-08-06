import '../domain/species.dart';

/// Garrick / Leervis (Lichia amia)
const garrickSpeciesProfile = Species(
  id: 'garrick',

  name: 'Garrick',

  scientificName: 'Lichia amia',

  aliases: [
    'Leervis',
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

  minWindSpeed: 8,

  maxWindSpeed: 22,

  minSwellHeight: 0.8,

  maxSwellHeight: 2.0,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Dawn',

  recommendedBait: 'Live Mullet',

  recommendedLure: 'Surface Popper',

  recommendedTrace: '60lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '6/0',
    '8/0',
  ],

  preferredWaterColour: 'Clean, moving water',

  preferredWaterTemperature: '19°C - 24°C',

  habitats: [
    'Surf Zone',
    'Estuary Mouths',
    'Current Lines',
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
  'Actively hunts schooling baitfish, particularly around estuary mouths and current lines, often attacking close to the surface.',

  notes:
  'A highly mobile predator that follows baitfish concentrations rather than a fixed location. Most active during the warmer months around dawn and dusk.',
);
