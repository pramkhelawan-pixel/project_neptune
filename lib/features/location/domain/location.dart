import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String id;

  final String name;

  final String province;

  final double latitude;

  final double longitude;

  final String description;

  final bool riverMouth;

  final bool reef;

  final bool sandbanks;

  final bool gullies;

  final bool safeAtNight;

  final List<String> targetSpecies;

  const Location({
    required this.id,
    required this.name,
    required this.province,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.riverMouth,
    required this.reef,
    required this.sandbanks,
    required this.gullies,
    required this.safeAtNight,
    required this.targetSpecies,
  });

  @override
  List<Object> get props => [
    id,
    name,
    province,
    latitude,
    longitude,
    description,
    riverMouth,
    reef,
    sandbanks,
    gullies,
    safeAtNight,
    targetSpecies,
  ];
}