import '../domain/species.dart';

const shadProfile = Species(
  id: 'shad',

  name: 'Shad',

  scientificName: 'Pomatomus saltatrix',

  preferredTides: [
    'Incoming',
    'High',
  ],

  preferredWindDirections: [
    'NE',
    'NW',
  ],

  minWindSpeed: 0,

  maxWindSpeed: 15,

  minSwellHeight: 1.0,

  maxSwellHeight: 2.5,

  preferredMoonPhases: [
    'Waxing Crescent',
    'First Quarter',
    'Waxing Gibbous',
    'Full Moon',
  ],

  preferredTime: 'Sunrise',

  recommendedBait: 'Live Mullet',

  recommendedLure: 'Silver Spoon',

  notes:
  'Highly active around sunrise during an incoming tide with moderate surf.',
);