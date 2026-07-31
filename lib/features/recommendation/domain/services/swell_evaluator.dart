// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: swell_evaluator.dart
//
// Purpose:
// Evaluates swell conditions and determines their contribution to Neptune's
// recommendation engine.
// -----------------------------------------------------------------------------

import '../../../marine/domain/models/marine_conditions.dart';

import '../entities/recommendation_reason.dart';
import 'recommendation_evaluator.dart';

/// Represents the outcome of a swell evaluation.
class SwellEvaluation {
  final int score;

  final RecommendationReason reason;

  const SwellEvaluation({
    required this.score,
    required this.reason,
  });
}

/// Evaluates swell conditions.
class SwellEvaluator
    implements RecommendationEvaluator<SwellEvaluation> {
  const SwellEvaluator();

  @override
  SwellEvaluation evaluate(
      MarineConditions marine,
      ) {
    if (marine.swellHeight <= 1.0) {
      return const SwellEvaluation(
        score: 12,
        reason: RecommendationReason(
          title: 'Excellent swell',
          explanation:
          'Low swell creates comfortable fishing conditions.',
          impact: 12,
        ),
      );
    }

    if (marine.swellHeight <= 2.0) {
      return const SwellEvaluation(
        score: 8,
        reason: RecommendationReason(
          title: 'Good swell',
          explanation:
          'Sea conditions appear suitable for most anglers.',
          impact: 8,
        ),
      );
    }

    if (marine.swellHeight <= 3.0) {
      return const SwellEvaluation(
        score: -4,
        reason: RecommendationReason(
          title: 'Moderate swell',
          explanation:
          'Larger swell may reduce fishing quality.',
          impact: -4,
        ),
      );
    }

    return const SwellEvaluation(
      score: -12,
      reason: RecommendationReason(
        title: 'Heavy swell',
        explanation:
        'Heavy swell makes fishing conditions challenging.',
        impact: -12,
      ),
    );
  }
}