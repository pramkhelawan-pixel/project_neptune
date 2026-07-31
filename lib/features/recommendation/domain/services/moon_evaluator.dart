// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: moon_evaluator.dart
//
// Purpose:
// Evaluates lunar conditions and determines their contribution to Neptune's
// recommendation engine.
// -----------------------------------------------------------------------------

import '../../../marine/domain/models/marine_conditions.dart';

import '../entities/recommendation_reason.dart';
import 'recommendation_evaluator.dart';

/// Represents the outcome of a moon evaluation.
class MoonEvaluation {
  final int score;

  final RecommendationReason reason;

  const MoonEvaluation({
    required this.score,
    required this.reason,
  });
}

/// Evaluates lunar conditions.
class MoonEvaluator
    implements RecommendationEvaluator<MoonEvaluation> {
  const MoonEvaluator();

  @override
  MoonEvaluation evaluate(
      MarineConditions marine,
      ) {
    switch (marine.moonPhase.toLowerCase()) {
      case 'new':
        return const MoonEvaluation(
          score: 10,
          reason: RecommendationReason(
            title: 'New Moon',
            explanation:
            'Many anglers associate the new moon with increased fish activity.',
            impact: 10,
          ),
        );

      case 'full':
        return const MoonEvaluation(
          score: 8,
          reason: RecommendationReason(
            title: 'Full Moon',
            explanation:
            'The full moon may improve feeding activity for some species.',
            impact: 8,
          ),
        );

      case 'first quarter':
      case 'last quarter':
        return const MoonEvaluation(
          score: 4,
          reason: RecommendationReason(
            title: 'Quarter Moon',
            explanation:
            'Moderate lunar influence on fishing conditions.',
            impact: 4,
          ),
        );

      default:
        return const MoonEvaluation(
          score: 0,
          reason: RecommendationReason(
            title: 'Neutral Moon Phase',
            explanation:
            'No significant lunar influence identified.',
            impact: 0,
          ),
        );
    }
  }
}