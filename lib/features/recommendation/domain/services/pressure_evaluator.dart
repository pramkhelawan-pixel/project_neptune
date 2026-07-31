// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: pressure_evaluator.dart
//
// Purpose:
// Evaluates atmospheric pressure and determines its contribution to Neptune's
// recommendation engine.
// -----------------------------------------------------------------------------

import '../../../marine/domain/models/marine_conditions.dart';

import '../entities/recommendation_reason.dart';
import 'recommendation_evaluator.dart';

/// Represents the outcome of a pressure evaluation.
class PressureEvaluation {
  final int score;

  final RecommendationReason reason;

  const PressureEvaluation({
    required this.score,
    required this.reason,
  });
}

/// Evaluates atmospheric pressure.
class PressureEvaluator
    implements RecommendationEvaluator<PressureEvaluation> {
  const PressureEvaluator();

  @override
  PressureEvaluation evaluate(
      MarineConditions marine,
      ) {
    if (marine.atmosphericPressure >= 1018) {
      return const PressureEvaluation(
        score: 12,
        reason: RecommendationReason(
          title: 'High stable pressure',
          explanation:
          'Stable atmospheric pressure generally supports active feeding.',
          impact: 12,
        ),
      );
    }

    if (marine.atmosphericPressure >= 1012) {
      return const PressureEvaluation(
        score: 6,
        reason: RecommendationReason(
          title: 'Normal pressure',
          explanation:
          'Pressure is within a favourable operating range.',
          impact: 6,
        ),
      );
    }

    if (marine.atmosphericPressure >= 1005) {
      return const PressureEvaluation(
        score: 0,
        reason: RecommendationReason(
          title: 'Falling pressure',
          explanation:
          'Pressure is beginning to decline.',
          impact: 0,
        ),
      );
    }

    return const PressureEvaluation(
      score: -12,
      reason: RecommendationReason(
        title: 'Low pressure',
        explanation:
        'Low atmospheric pressure often reduces feeding activity.',
        impact: -12,
      ),
    );
  }
}