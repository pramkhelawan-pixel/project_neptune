class Species {
  final String id;

  final String name;

  final String scientificName;

  final List<String> preferredTides;

  final List<String> preferredWindDirections;

  final double minWindSpeed;
  final double maxWindSpeed;

  final double minSwellHeight;
  final double maxSwellHeight;

  final List<String> preferredMoonPhases;

  final String preferredTime;

  final String recommendedBait;

  final String recommendedLure;

  final String notes;

  const Species({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.preferredTides,
    required this.preferredWindDirections,
    required this.minWindSpeed,
    required this.maxWindSpeed,
    required this.minSwellHeight,
    required this.maxSwellHeight,
    required this.preferredMoonPhases,
    required this.preferredTime,
    required this.recommendedBait,
    required this.recommendedLure,
    required this.notes,
  });
}