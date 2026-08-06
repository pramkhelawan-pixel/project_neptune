import '../domain/species.dart';

/// Duckbill Ray (Aetomylaeus bovinus)
const duckbillRaySpeciesProfile = Species(
  id: 'duckbill_ray',

  name: 'Duckbill Ray',

  scientificName: 'Aetomylaeus bovinus',

  aliases: [
    'Bull Ray',
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

  maxWindSpeed: 15,

  minSwellHeight: 0.3,

  maxSwellHeight: 1.5,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Night',

  recommendedBait: 'Sand Prawn or Mussel',

  recommendedLure: 'Not targeted with lures',

  recommendedTrace: '80lb Monofilament Leader',

  recommendedHookSizes: [
    '6/0',
    '8/0',
  ],

  preferredWaterColour: 'Slightly discoloured water',

  preferredWaterTemperature: '18°C - 24°C',

  habitats: [
    'Estuaries',
    'Sandy Surf Gutters',
    'Sheltered Bays',
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
  'Uses flattened crushing plates to feed on mussels, crabs and other shelled invertebrates rooted out of sand and mud on the bottom.',

  notes:
  'A powerful, heavy-bodied ray that produces long, stubborn runs when hooked, making it a popular endurance target for estuary and surf anglers. Handle with caution: the tail carries a venomous spine. Best released quickly without lifting from the water.',

  isEdible: false,
);
