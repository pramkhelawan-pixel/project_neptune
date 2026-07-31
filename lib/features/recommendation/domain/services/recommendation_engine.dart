import '../../../marine/domain/models/marine_conditions.dart';
import '../../../session/domain/entities/fishing_session.dart';

import '../entities/fishing_recommendation.dart';
import '../entities/recommendation_level.dart';
import '../entities/recommendation_reason.dart';

class RecommendationEngine {
  const RecommendationEngine();

  FishingRecommendation evaluate(
      FishingSession session,
      ) {
    final MarineConditions marine = session.marineConditions;

    int score = 50;

    final reasons = <RecommendationReason>[];

    // Wind

    if (marine.windSpeed <= 15) {
      score += 10;

      reasons.add(
        const RecommendationReason(
          title: 'Favourable wind',
          explanation:
          'Wind speed is suitable for most surf conditions.',
          impact: 10,
        ),
      );
    } else {
      score -= 12;

      reasons.add(
        const RecommendationReason(
          title: 'Strong wind',
          explanation:
          'Strong winds may reduce fishing quality.',
          impact: -12,
        ),
      );
    }

    // Swell

    if (marine.swellHeight <= 2.0) {
      score += 8;

      reasons.add(
        const RecommendationReason(
          title: 'Manageable swell',
          explanation:
          'Sea conditions appear fishable.',
          impact: 8,
        ),
      );
    } else {
      score -= 10;

      reasons.add(
        const RecommendationReason(
          title: 'Heavy swell',
          explanation:
          'Large swell may reduce water clarity.',
          impact: -10,
        ),
      );
    }

    // Tide

    if (marine.tideHeight > 1.0) {
      score += 6;

      reasons.add(
        const RecommendationReason(
          title: 'Good tidal movement',
          explanation:
          'Healthy tidal movement often increases feeding activity.',
          impact: 6,
        ),
      );
    }

    // Clamp

    if (score > 100) {
      score = 100;
    }

    if (score < 0) {
      score = 0;
    }

    RecommendationLevel level;

    if (score >= 90) {
      level = RecommendationLevel.excellent;
    } else if (score >= 75) {
      level = RecommendationLevel.good;
    } else if (score >= 55) {
      level = RecommendationLevel.fair;
    } else if (score >= 35) {
      level = RecommendationLevel.poor;
    } else {
      level = RecommendationLevel.notRecommended;
    }

    return FishingRecommendation(
      level: level,
      confidence: score,
      reasons: reasons,
      summary: _summary(level),
    );
  }

  String _summary(
      RecommendationLevel level,
      ) {
    switch (level) {
      case RecommendationLevel.excellent:
        return 'Excellent fishing opportunity.';

      case RecommendationLevel.good:
        return 'Good conditions for most anglers.';

      case RecommendationLevel.fair:
        return 'Conditions are acceptable but not ideal.';

      case RecommendationLevel.poor:
        return 'Fishing may be difficult today.';

      case RecommendationLevel.notRecommended:
        return 'Neptune advises postponing this trip.';
    }
  }
}