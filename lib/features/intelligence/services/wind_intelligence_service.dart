// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: wind_intelligence_service.dart
//
// Purpose:
// Evaluates wind conditions and produces a canonical IntelligenceFactor.
//
// This service represents Neptune's wind intelligence. It assesses the
// suitability of observed wind conditions and contributes a weighted score
// towards the overall FishingIntelligence assessment.
//
// -----------------------------------------------------------------------------

import '../../knowledge/domain/enums/confidence_level.dart';
import '../domain/entities/intelligence_factor.dart';

class WindIntelligenceService {
  const WindIntelligenceService();

  IntelligenceFactor evaluate({
    required double windSpeed,
    required String windDirection,
  }) {
    double score;
    String explanation;

    if (windSpeed >= 10 &&
        windSpeed <= 20 &&
        windDirection.toUpperCase() == 'NE') {
      score = 100;
      explanation =
      'Ideal north-easterly wind with favourable speed.';
    } else if (windSpeed >= 5 && windSpeed <= 25) {
      score = 75;
      explanation =
      'Acceptable wind conditions for most surf fishing.';
    } else {
      score = 40;
      explanation =
      'Wind conditions are currently less favourable.';
    }

    return IntelligenceFactor(
      name: 'Wind',
      observedValue:
      '${windSpeed.toStringAsFixed(1)} km/h $windDirection',
      idealValue: '10–20 km/h NE',
      score: score,
      weight: 0.20,
      confidence: ConfidenceLevel.high,
      explanation: explanation,
    );
  }
}