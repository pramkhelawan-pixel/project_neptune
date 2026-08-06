import '../domain/species.dart';

/// White Steenbras (Lithognathus lithognathus)
const whiteSteenbrasSpeciesProfile = Species(
  id: 'white_steenbras',

  name: 'White Steenbras',

  scientificName: 'Lithognathus lithognathus',

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

  preferredTime: 'Night',

  recommendedBait: 'Live Sand Prawn',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '40lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '4/0',
    '6/0',
  ],

  preferredWaterColour: 'Clean to slightly discoloured water',

  preferredWaterTemperature: '15°C - 20°C',

  habitats: [
    'Surf Gutters',
    'Sandy Beaches',
  ],

  distribution: [
    'Eastern Cape',
    'Western Cape',
    'KwaZulu-Natal',
  ],

  seasons: [
    'Autumn',
    'Winter',
    'Spring',
  ],

  feedingBehaviour:
  'Probes sandy surf gutters with an elongated snout, feeding primarily on sand prawns and marine worms.',

  notes:
  'A historically vulnerable species subject to conservation regulation, always confirm current size and bag limits before targeting. Sand prawn is regarded as the standout bait.',
);
