// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: evaluation_result.dart
//
// Purpose:
// Represents the result produced by an individual environmental evaluator.
//
// Every evaluator within Neptune returns an EvaluationResult. The
// RecommendationEngine aggregates these results into a final fishing
// recommendation.
//
// This standardised structure keeps every evaluator independent while
// allowing the recommendation engine to evolve without changing evaluator
// implementations.
// -----------------------------------------------------------------------------

import 'recommendation_reason.dart';

/// Represents the output of a single environmental evaluator.
class EvaluationResult {
  /// Numerical score contribution.
  final double score;

  /// Confidence in this evaluation.
  final double confidence;

  /// Explanation presented to the angler.
  final RecommendationReason reason;

  /// Creates an immutable evaluation result.
  const EvaluationResult({
    required this.score,
    required this.confidence,
    required this.reason,
  });

  /// True when this evaluation improves the recommendation.
  bool get isPositive => score > 0;

  /// True when this evaluation negatively affects the recommendation.
  bool get isNegative => score < 0;

  /// True when this evaluation has no effect.
  bool get isNeutral => score == 0;

  /// Returns a copy with updated values.
  EvaluationResult copyWith({
    double? score,
    double? confidence,
    RecommendationReason? reason,
  }) {
    return EvaluationResult(
      score: score ?? this.score,
      confidence: confidence ?? this.confidence,
      reason: reason ?? this.reason,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is EvaluationResult &&
        other.score == score &&
        other.confidence == confidence &&
        other.reason == reason;
  }

  @override
  int get hashCode => Object.hash(
    score,
    confidence,
    reason,
  );

  @override
  String toString() {
    return 'EvaluationResult('
        'score: $score, '
        'confidence: $confidence, '
        'reason: $reason'
        ')';
  }
}