// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: tide_evaluator.dart
//
// Purpose:
// Evaluates tidal conditions and determines their contribution to the overall
// fishing recommendation.
// -----------------------------------------------------------------------------

import '../../../marine/domain/models/marine_conditions.dart';

import '../entities/recommendation_reason.dart';

/// Represents the outcome of a tide evaluation.
class TideEvaluation {
  final int score;

  final RecommendationReason reason;

  const TideEvaluation({
    required this.score,
    required this.reason,
  });
}

/// Evaluates tidal conditions.
class TideEvaluator {
  const TideEvaluator();

  TideEvaluation evaluate(
      MarineConditions marine,
      ) {
    if (marine.tideHeight >= 1.5) {
      return const TideEvaluation(
        score: 12,
        reason: RecommendationReason(
          title: 'Excellent tide',
          explanation:
          'Strong tidal movement often improves feeding activity.',
          impact: 12,
        ),
      );
    }

    if (marine.tideHeight >= 1.0) {
      return const TideEvaluation(
        score: 6,
        reason: RecommendationReason(
          title: 'Good tide',
          explanation:
          'Healthy tidal movement supports fishing activity.',
          impact: 6,
        ),
      );
    }

    if (marine.tideHeight >= 0.5) {
      return const TideEvaluation(
        score: 0,
        reason: RecommendationReason(
          title: 'Moderate tide',
          explanation:
          'Limited tidal movement may reduce fish activity.',
          impact: 0,
        ),
      );
    }

    return const TideEvaluation(
      score: -10,
      reason: RecommendationReason(
        title: 'Weak tide',
        explanation:
        'Very little tidal movement is generally less favourable.',
        impact: -10,
      ),
    );
  }
}