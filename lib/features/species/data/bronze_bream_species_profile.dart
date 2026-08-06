import '../domain/species.dart';

/// Bronze Bream (Pachymetopon grande)
const bronzeBreamSpeciesProfile = Species(
  id: 'bronze_bream',

  name: 'Bronze Bream',

  scientificName: 'Pachymetopon grande',

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

  maxWindSpeed: 20,

  minSwellHeight: 1.0,

  maxSwellHeight: 2.5,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Early Morning',

  recommendedBait: 'Black Mussel',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '40lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '1/0',
    '2/0',
  ],

  preferredWaterColour: 'Slightly discoloured water',

  preferredWaterTemperature: '17°C - 22°C',

  habitats: [
    'Reef',
    'Gullies',
    'Deep Surf Gutters Adjacent to Structure',
  ],

  distribution: [
    'KwaZulu-Natal',
    'Eastern Cape',
    'Western Cape',
  ],

  seasons: [
    'Autumn',
    'Winter',
    'Spring',
  ],

  feedingBehaviour:
  'Grazes over reef and gully structure, feeding on mussel, redbait and small crustaceans dislodged by wave action.',

  notes:
  'A strong-fighting reef species best targeted close to structure. Forged, strong hooks are recommended as Bronze Bream fight hard near reef and rock.',
);
