import '../domain/species.dart';

/// Cape Stumpnose (Rhabdosargus holubi)
const stumpnoseSpeciesProfile = Species(
  id: 'stumpnose',

  name: 'Stumpnose',

  scientificName: 'Rhabdosargus holubi',

  aliases: [
    'Cape Stumpnose',
  ],

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

  recommendedBait: 'Live Mud Prawn',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '15lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '2',
    '1/0',
  ],

  preferredWaterColour: 'Clean water',

  preferredWaterTemperature: '18°C - 24°C',

  habitats: [
    'Estuary Mouths',
    'Eelgrass Beds',
    'Adjacent Surf Zone',
  ],

  distribution: [
    'KwaZulu-Natal',
    'Eastern Cape',
  ],

  seasons: [
    'Spring',
    'Summer',
    'Autumn',
  ],

  feedingBehaviour:
  'An omnivorous feeder taking prawns, small crabs and mussel, and also grazing on eelgrass beds within estuaries.',

  notes:
  'Most productive around estuary mouths and adjacent surf on an incoming tide, particularly where eelgrass beds are present.',
);
