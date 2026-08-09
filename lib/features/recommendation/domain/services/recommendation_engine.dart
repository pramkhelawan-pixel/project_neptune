import '../../../marine/domain/models/marine_conditions.dart';
import '../../../session/domain/entities/fishing_session.dart';

import '../entities/fishing_recommendation.dart';
import '../entities/recommendation_level.dart';
import '../entities/recommendation_reason.dart';

import 'wind_evaluator.dart';
import 'swell_evaluator.dart';
import 'tide_evaluator.dart';
import 'pressure_evaluator.dart';
import 'moon_evaluator.dart';

/// Neptune's core intelligence engine.
///
/// Coordinates the environmental evaluators and produces the final
/// fishing recommendation.
///
/// Version 1 is rule-based and designed for future expansion.
class RecommendationEngine {
  const RecommendationEngine();

  final WindEvaluator _windEvaluator =
  const WindEvaluator();

  final SwellEvaluator _swellEvaluator =
  const SwellEvaluator();

  final TideEvaluator _tideEvaluator =
  const TideEvaluator();

  final PressureEvaluator _pressureEvaluator =
  const PressureEvaluator();

  final MoonEvaluator _moonEvaluator =
  const MoonEvaluator();

  FishingRecommendation evaluate(
      FishingSession session,
      ) {
    final MarineConditions? marineOrNull =
        session.marineConditions;

    if (marineOrNull == null) {
      throw StateError(
        'RecommendationEngine requires a session with known marine conditions.',
      );
    }

    final MarineConditions marine = marineOrNull;

    int score = 50;

    final reasons = <RecommendationReason>[];

    //----------------------------------------------------------------------
    // Wind
    //----------------------------------------------------------------------

    final wind =
    _windEvaluator.evaluate(marine);

    score += wind.score;

    reasons.add(wind.reason);

    //----------------------------------------------------------------------
    // Swell
    //----------------------------------------------------------------------

    final swell =
    _swellEvaluator.evaluate(marine);

    score += swell.score;

    reasons.add(swell.reason);

    //----------------------------------------------------------------------
    // Tide
    //----------------------------------------------------------------------

    final tide =
    _tideEvaluator.evaluate(marine);

    score += tide.score;

    reasons.add(tide.reason);

    //----------------------------------------------------------------------
    // Pressure
    //----------------------------------------------------------------------

    final pressure =
    _pressureEvaluator.evaluate(marine);

    score += pressure.score;

    reasons.add(pressure.reason);

    //----------------------------------------------------------------------
    // Moon
    //----------------------------------------------------------------------

    final moon =
    _moonEvaluator.evaluate(marine);

    score += moon.score;

    reasons.add(moon.reason);

    //----------------------------------------------------------------------
    // Clamp score
    //----------------------------------------------------------------------

    if (score > 100) {
      score = 100;
    }

    if (score < 0) {
      score = 0;
    }

    //----------------------------------------------------------------------
    // Recommendation Level
    //----------------------------------------------------------------------

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