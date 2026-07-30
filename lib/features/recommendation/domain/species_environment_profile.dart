class SpeciesEnvironmentProfile {
  final String species;

  final double minimumWaterTemperature;
  final double maximumWaterTemperature;

  final double minimumSwellHeight;
  final double maximumSwellHeight;

  final List<String> preferredTides;

  final List<String> preferredWindDirections;

  final List<String> preferredMoonPhases;

  const SpeciesEnvironmentProfile({
    required this.species,
    required this.minimumWaterTemperature,
    required this.maximumWaterTemperature,
    required this.minimumSwellHeight,
    required this.maximumSwellHeight,
    required this.preferredTides,
    required this.preferredWindDirections,
    required this.preferredMoonPhases,
  });
}