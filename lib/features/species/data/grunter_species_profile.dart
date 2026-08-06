import '../domain/species.dart';

/// Spotted Grunter (Pomadasys commersonnii)
const grunterSpeciesProfile = Species(
  id: 'grunter',

  name: 'Grunter',

  scientificName: 'Pomadasys commersonnii',

  aliases: [
    'Spotted Grunter',
  ],

  preferredTides: [
    'Incoming',
    'High',
  ],

  preferredWindDirections: [
    'NE',
    'E',
    'SE',
  ],

  minWindSpeed: 5,

  maxWindSpeed: 20,

  minSwellHeight: 0.5,

  maxSwellHeight: 1.5,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Night',

  recommendedBait: 'Live Mud Prawn',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '20lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '1',
    '1/0',
  ],

  preferredWaterColour: 'Discoloured, murky water',

  preferredWaterTemperature: '18°C - 24°C',

  habitats: [
    'Estuaries',
    'Estuary Mouths',
    'Murky Surf Adjacent to River Mouths',
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
  'Roots in sand and mud for prawns and worms, particularly active in discoloured water and after rain when estuaries carry more sediment.',

  notes:
  'Prefers murky, discoloured water over clean conditions. Most active at night and around estuary mouths on a rising tide.',
);
