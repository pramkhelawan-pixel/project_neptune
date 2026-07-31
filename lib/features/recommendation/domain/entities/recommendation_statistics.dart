// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: recommendation_statistics.dart
//
// Purpose:
// Represents statistical information produced during a recommendation
// evaluation.
//
// These statistics provide insight into how Neptune arrived at the final
// recommendation and will support future AI learning, reporting and analytics.
// -----------------------------------------------------------------------------

/// Represents recommendation evaluation statistics.
class RecommendationStatistics {
  /// Total calculated score.
  final double totalScore;

  /// Maximum possible score.
  final double maximumScore;

  /// Number of positive factors.
  final int positiveFactors;

  /// Number of negative factors.
  final int negativeFactors;

  /// Number of neutral factors.
  final int neutralFactors;

  const RecommendationStatistics({
    required this.totalScore,
    required this.maximumScore,
    required this.positiveFactors,
    required this.negativeFactors,
    required this.neutralFactors,
  });

  /// Returns the percentage score.
  double get scorePercentage =>
      maximumScore == 0
          ? 0
          : (totalScore / maximumScore) * 100;

  /// Returns true when all factors were positive.
  bool get allPositive =>
      negativeFactors == 0 &&
          neutralFactors == 0;

  /// Returns true when any negative factors exist.
  bool get hasNegativeFactors =>
      negativeFactors > 0;

  /// Total evaluated factors.
  int get totalFactors =>
      positiveFactors +
          negativeFactors +
          neutralFactors;

  RecommendationStatistics copyWith({
    double? totalScore,
    double? maximumScore,
    int? positiveFactors,
    int? negativeFactors,
    int? neutralFactors,
  }) {
    return RecommendationStatistics(
      totalScore: totalScore ?? this.totalScore,
      maximumScore: maximumScore ?? this.maximumScore,
      positiveFactors:
      positiveFactors ?? this.positiveFactors,
      negativeFactors:
      negativeFactors ?? this.negativeFactors,
      neutralFactors:
      neutralFactors ?? this.neutralFactors,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RecommendationStatistics &&
            other.totalScore == totalScore &&
            other.maximumScore == maximumScore &&
            other.positiveFactors == positiveFactors &&
            other.negativeFactors == negativeFactors &&
            other.neutralFactors == neutralFactors;
  }

  @override
  int get hashCode => Object.hash(
    totalScore,
    maximumScore,
    positiveFactors,
    negativeFactors,
    neutralFactors,
  );

  @override
  String toString() {
    return 'RecommendationStatistics('
        'score: $totalScore/$maximumScore, '
        'positive: $positiveFactors, '
        'negative: $negativeFactors, '
        'neutral: $neutralFactors'
        ')';
  }
}