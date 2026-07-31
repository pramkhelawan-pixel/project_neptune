// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: recommendation_result.dart
//
// Purpose:
// Represents the complete output produced by Neptune's recommendation engine.
//
// A RecommendationResult contains the overall recommendation together with
// the environmental factors that contributed to the final score.
//
// Future versions will support AI confidence, prediction accuracy,
// species-specific intelligence and historical learning.
// -----------------------------------------------------------------------------

import 'fishing_recommendation.dart';
import 'recommendation_factor.dart';

/// Represents the complete recommendation produced by Neptune.
class RecommendationResult {
  /// Final recommendation.
  final FishingRecommendation recommendation;

  /// Individual contributing factors.
  final List<RecommendationFactor> factors;

  const RecommendationResult({
    required this.recommendation,
    this.factors = const [],
  });

  /// Returns true when factors exist.
  bool get hasFactors => factors.isNotEmpty;

  /// Number of evaluated factors.
  int get factorCount => factors.length;

  /// Positive factors.
  List<RecommendationFactor> get positiveFactors =>
      factors.where((f) => f.isPositive).toList();

  /// Negative factors.
  List<RecommendationFactor> get negativeFactors =>
      factors.where((f) => f.isNegative).toList();

  /// Neutral factors.
  List<RecommendationFactor> get neutralFactors =>
      factors.where((f) => f.isNeutral).toList();

  RecommendationResult copyWith({
    FishingRecommendation? recommendation,
    List<RecommendationFactor>? factors,
  }) {
    return RecommendationResult(
      recommendation: recommendation ?? this.recommendation,
      factors: factors ?? this.factors,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RecommendationResult &&
            other.recommendation == recommendation &&
            other.factors.length == factors.length;
  }

  @override
  int get hashCode =>
      Object.hash(recommendation, factors.length);

  @override
  String toString() {
    return 'RecommendationResult('
        'recommendation: $recommendation, '
        'factors: ${factors.length}'
        ')';
  }
}