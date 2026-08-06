import '../domain/species.dart';

/// Diamond Ray (Gymnura natalensis)
const diamondRaySpeciesProfile = Species(
  id: 'diamond_ray',

  name: 'Diamond Ray',

  scientificName: 'Gymnura natalensis',

  aliases: [
    'Backwater Butterfly Ray',
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

  maxWindSpeed: 15,

  minSwellHeight: 0.2,

  maxSwellHeight: 1.0,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Night',

  recommendedBait: 'Live Prawn or Small Baitfish',

  recommendedLure: 'Not targeted with lures',

  recommendedTrace: '50lb Monofilament Leader',

  recommendedHookSizes: [
    '3/0',
    '5/0',
  ],

  preferredWaterColour: 'Slightly discoloured water',

  preferredWaterTemperature: '19°C - 25°C',

  habitats: [
    'Estuaries',
    'Shallow Sandbanks',
    'Mangrove Fringed Channels',
  ],

  distribution: [
    'KwaZulu-Natal',
  ],

  seasons: [
    'Summer',
    'Autumn',
  ],

  feedingBehaviour:
  'An ambush feeder that buries itself in sand or mud in shallow water, striking at small fish and crustaceans that pass close by.',

  notes:
  'Its broad, near-tailless diamond-shaped body gives an unmistakable, powerful pulling fight in shallow estuary water. A popular light-tackle target for estuary anglers, particularly at night. Carries a venomous tail spine and should be released with care.',

  isEdible: false,
);
