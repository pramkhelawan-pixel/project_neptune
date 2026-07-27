class RecommendationResponse {
  final String species;

  final String bait;

  final String location;

  final String bestTime;

  final int confidence;

  final List<String> explanations;

  const RecommendationResponse({
    required this.species,
    required this.bait,
    required this.location,
    required this.bestTime,
    required this.confidence,
    required this.explanations,
  });
}