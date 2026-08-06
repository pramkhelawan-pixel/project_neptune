import '../domain/species.dart';

/// Black Musselcracker (Cymatoceps nasutus)
const blackMusselcrackerSpeciesProfile = Species(
  id: 'black_musselcracker',

  name: 'Black Musselcracker',

  scientificName: 'Cymatoceps nasutus',

  aliases: [
    'Poenskop',
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

  minWindSpeed: 5,

  maxWindSpeed: 18,

  minSwellHeight: 1.0,

  maxSwellHeight: 2.2,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Early Morning',

  recommendedBait: 'Cracked Mussel',

  recommendedLure: 'Not commonly targeted with lures',

  recommendedTrace: '80lb Fluorocarbon Leader',

  recommendedHookSizes: [
    '6/0',
    '8/0',
  ],

  preferredWaterColour: 'Clean water over reef',

  preferredWaterTemperature: '17°C - 22°C',

  habitats: [
    'Reef',
    'Deep Gullies',
    'Rocky Structure',
  ],

  distribution: [
    'Eastern Cape',
    'Western Cape',
    'KwaZulu-Natal',
  ],

  seasons: [
    'Winter',
    'Spring',
  ],

  feedingBehaviour:
  'A powerful reef predator with crushing jaws adapted for mussel, crab and urchin, typically found close to structure.',

  notes:
  'Slow-growing and long-lived, making it particularly vulnerable to overfishing, subject to strict conservation regulation. Heavy tackle is required to control fish away from reef structure.',
);
