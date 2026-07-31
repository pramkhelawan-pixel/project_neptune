import '../../../marine/domain/models/marine_conditions.dart';

import '../entities/recommendation_reason.dart';

class WindEvaluation {
  final int score;
  final RecommendationReason reason;

  const WindEvaluation({
    required this.score,
    required this.reason,
  });
}

class WindEvaluator {
  const WindEvaluator();

  WindEvaluation evaluate(
      MarineConditions marine,
      ) {
    if (marine.windSpeed <= 10) {
      return const WindEvaluation(
        score: 18,
        reason: RecommendationReason(
          title: 'Excellent wind',
          explanation:
          'Light winds favour comfortable surf fishing.',
          impact: 18,
        ),
      );
    }

    if (marine.windSpeed <= 15) {
      return const WindEvaluation(
        score: 10,
        reason: RecommendationReason(
          title: 'Good wind',
          explanation:
          'Wind speed is suitable.',
          impact: 10,
        ),
      );
    }

    if (marine.windSpeed <= 25) {
      return const WindEvaluation(
        score: -5,
        reason: RecommendationReason(
          title: 'Moderate wind',
          explanation:
          'Fishing may become more difficult.',
          impact: -5,
        ),
      );
    }

    return const WindEvaluation(
      score: -20,
      reason: RecommendationReason(
        title: 'Strong wind',
        explanation:
        'Strong winds reduce fishing quality.',
        impact: -20,
      ),
    );
  }
}