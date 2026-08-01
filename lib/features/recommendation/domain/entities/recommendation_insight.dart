/// Explains why Neptune made a recommendation.
class RecommendationInsight {
  final String title;

  final String description;

  final bool positive;

  const RecommendationInsight({
    required this.title,
    required this.description,
    required this.positive,
  });
}