import '../domain/species.dart';

/// Smoothhound Shark (Mustelus mustelus)
const smoothhoundSharkSpeciesProfile = Species(
  id: 'smoothhound_shark',

  name: 'Smoothhound Shark',

  scientificName: 'Mustelus mustelus',

  aliases: [
    'Smooth-hound',
    'Gray Smoothhound',
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

  maxWindSpeed: 15,

  minSwellHeight: 0.3,

  maxSwellHeight: 1.2,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Early Morning',

  recommendedBait: 'Sand Prawn or Bloodworm',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '30lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '2/0',
    '4/0',
  ],

  preferredWaterColour: 'Clean water',

  preferredWaterTemperature: '13°C - 19°C',

  habitats: [
    'Sandy Bays',
    'Estuaries',
    'Shallow Surf Flats',
  ],

  distribution: [
    'Western Cape',
    'Eastern Cape',
  ],

  seasons: [
    'Winter',
    'Spring',
  ],

  feedingBehaviour:
  'Forages over sand and mud flats for crabs, shrimp and small bottom-dwelling invertebrates, often moving into shallow water on the push of the tide.',

  notes:
  'A light-tackle favourite thanks to its blunt, crushing teeth (no wire required) and willingness to bite confidently. Popular with beach and estuary anglers looking for a reliable, hard-fighting catch-and-release species.',

  isEdible: false,
);
