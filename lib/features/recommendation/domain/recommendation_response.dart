class RecommendationResponse {
  final String species;

  final String bait;

  final String hook;

  final String leader;

  final String presentation;

  final String location;

  final String bestTime;

  final double confidence;

  /// The raw environmental condition-match score (see [EnvironmentalEvaluator])
  /// that [confidence] was derived from. Distinct from [confidence]: this is
  /// the actual factor-match count, not the confidence lookup's transformed
  /// value. Kept separate so a screen showing both never redisplays the same
  /// underlying number under two different labels as if they were
  /// independent measurements.
  final int score;

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
    required this.score,
    required this.explanations,
  });
}