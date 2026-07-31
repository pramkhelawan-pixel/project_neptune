/// A single explanation used by Neptune.
///
/// Multiple reasons form the explanation shown to the angler.
class RecommendationReason {
  final String title;

  final String explanation;

  final double impact;

  const RecommendationReason({
    required this.title,
    required this.explanation,
    required this.impact,
  });

  bool get isPositive => impact > 0;

  bool get isNegative => impact < 0;
}