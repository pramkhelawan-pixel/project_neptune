import '../domain/location.dart';

const blueLagoon = Location(
  id: 'LOC-KZN-0001',
  name: 'Blue Lagoon',
  province: 'KwaZulu-Natal',
  latitude: -29.7919,
  longitude: 31.0446,
  description:
  'Blue Lagoon is a well-known surf fishing location at the mouth of the Umgeni River, offering a mix of estuarine and surf fishing opportunities.',

  riverMouth: true,

  reef: false,

  sandbanks: true,

  gullies: true,

  safeAtNight: false,

  targetSpecies: [
    'Shad',
    'Garrick',
    'Kob',
    'Bronze Bream',
    'Blacktail',
    'Stumpnose',
  ],
);