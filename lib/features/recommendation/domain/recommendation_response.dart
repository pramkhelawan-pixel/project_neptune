class RecommendationResponse {
  final String species;

  final String bait;

  final String hook;

  final String leader;

  final String presentation;

  final String location;

  final String bestTime;

  final double confidence;

  final List<String> explanations;

  const RecommendationResponse({
    required this.species,
    required this.bait,
    required this.hook,
    required this.leader,
    required this.presentation,
    required this.location,
    required this.bestTime,
    required this.confidence,
    required this.explanations,
  });
}