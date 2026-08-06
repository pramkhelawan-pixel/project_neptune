import '../domain/species.dart';

/// Guitarfish (Rhinobatos annulatus)
const guitarfishSpeciesProfile = Species(
  id: 'guitarfish',

  name: 'Guitarfish',

  scientificName: 'Rhinobatos annulatus',

  aliases: [
    'Lesser Sandshark',
    'Sand Shark',
  ],

  preferredTides: [
    'Low',
    'Incoming',
  ],

  preferredWindDirections: [
    'SW',
    'S',
  ],

  minWindSpeed: 0,

  maxWindSpeed: 20,

  minSwellHeight: 0.3,

  maxSwellHeight: 1.5,

  preferredMoonPhases: [
    'New',
    'Full',
    'First Quarter',
    'Last Quarter',
  ],

  preferredTime: 'Early Morning',

  recommendedBait: 'Bloodworm or Sand Prawn',

  recommendedLure: 'Not targeted with lures',

  recommendedTrace: '25lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '1/0',
    '2/0',
  ],

  preferredWaterColour: 'Clean to slightly discoloured water',

  preferredWaterTemperature: '14°C - 22°C',

  habitats: [
    'Surf Zone',
    'Estuaries',
    'Shallow Sandy Bays',
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
  'A common bottom feeder that roots through sand for worms and small crustaceans, frequently caught within casting distance of the shore.',

  notes:
  'One of the most reliable and beginner-friendly catch-and-release species along the South African coast. Docile, easy to handle and toothless, it is a common first shark-like catch for junior anglers fishing light surf tackle.',

  isEdible: false,
);
