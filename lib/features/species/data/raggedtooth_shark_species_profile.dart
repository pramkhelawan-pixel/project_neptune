import '../domain/species.dart';

/// Ragged-tooth Shark (Carcharias taurus)
const raggedtoothSharkSpeciesProfile = Species(
  id: 'raggedtooth_shark',

  name: 'Ragged-tooth Shark',

  scientificName: 'Carcharias taurus',

  aliases: [
    'Raggie',
    'Sand Tiger Shark',
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

  minSwellHeight: 0.5,

  maxSwellHeight: 2.0,

  preferredMoonPhases: [
    'New',
    'Full',
  ],

  preferredTime: 'Dawn and Dusk',

  recommendedBait: 'Fresh Mullet, Mackerel or Fish Head',

  recommendedLure: 'Not targeted with lures',

  recommendedTrace: '200lb Wire or Heavy Monofilament Leader',

  recommendedHookSizes: [
    '10/0',
    '12/0',
  ],

  preferredWaterColour: 'Clean water',

  preferredWaterTemperature: '17°C - 23°C',

  habitats: [
    'Reef Systems',
    'Sandy Bottomed Gullies',
    'Offshore Ridges',
  ],

  distribution: [
    'KwaZulu-Natal',
    'Eastern Cape',
  ],

  seasons: [
    'Autumn',
    'Winter',
  ],

  feedingBehaviour:
  'Slow-moving nocturnal hunter that feeds on small fish, forming large seasonal aggregations around reef systems such as Aliwal Shoal and Protea Banks during the winter sardine run.',

  notes:
  'The Ragged-tooth Shark is a protected species under South African law: it is illegal to target it with intent to retain, and it must never be removed from the water. It remains a hugely popular catch-and-release species for shore and boat anglers during its winter aggregations. Heavy tackle, circle hooks and quick, careful release handling are mandatory.',

  isEdible: false,
);
