class Recommendation {
  final String species;

  final String bait;

  final String location;

  final String bestTime;

  final int score;

  final int confidence;

  final List<String> reasons;

  const Recommendation({
    required this.species,
    required this.bait,
    required this.location,
    required this.bestTime,
    required this.score,
    required this.confidence,
    required this.reasons,
  });
}