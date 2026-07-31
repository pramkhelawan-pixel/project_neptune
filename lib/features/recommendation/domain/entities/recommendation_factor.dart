// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: recommendation_factor.dart
//
// Purpose:
// Represents a single environmental factor used when calculating a fishing
// recommendation.
//
// Every recommendation is built from multiple RecommendationFactor objects,
// allowing Neptune to explain exactly why a recommendation was produced.
//
// Future versions will support machine learning weighting, historical
// performance and species-specific intelligence.
// -----------------------------------------------------------------------------

/// Represents one environmental factor used in a recommendation.
class RecommendationFactor {
  /// Name of the factor.
  final String name;

  /// Score contribution.
  final double score;

  /// Maximum possible score.
  final double maxScore;

  /// Human-readable explanation.
  final String explanation;

  const RecommendationFactor({
    required this.name,
    required this.score,
    required this.maxScore,
    required this.explanation,
  });

  /// Returns true when the factor contributed positively.
  bool get isPositive => score > 0;

  /// Returns true when the factor contributed negatively.
  bool get isNegative => score < 0;

  /// Returns true when neutral.
  bool get isNeutral => score == 0;

  /// Percentage contribution.
  double get percentage =>
      maxScore == 0 ? 0 : (score / maxScore) * 100;

  RecommendationFactor copyWith({
    String? name,
    double? score,
    double? maxScore,
    String? explanation,
  }) {
    return RecommendationFactor(
      name: name ?? this.name,
      score: score ?? this.score,
      maxScore: maxScore ?? this.maxScore,
      explanation: explanation ?? this.explanation,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RecommendationFactor &&
            other.name == name &&
            other.score == score &&
            other.maxScore == maxScore &&
            other.explanation == explanation;
  }

  @override
  int get hashCode =>
      Object.hash(name, score, maxScore, explanation);

  @override
  String toString() {
    return 'RecommendationFactor('
        'name: $name, '
        'score: $score, '
        'maxScore: $maxScore'
        ')';
  }
}