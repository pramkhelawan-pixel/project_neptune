// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: water_temperature_intelligence_service.dart
//
// Purpose:
// Evaluates water temperature and produces a canonical IntelligenceFactor.
//
// Water temperature has a significant influence on fish behaviour, feeding
// activity and species distribution. This service contributes its assessment
// to Neptune's overall Fishing Intelligence.
//
// -----------------------------------------------------------------------------

import '../../knowledge/domain/enums/confidence_level.dart';
import '../domain/entities/intelligence_factor.dart';

class WaterTemperatureIntelligenceService {
  const WaterTemperatureIntelligenceService();

  IntelligenceFactor evaluate({
    required double waterTemperature,
  }) {
    double score;
    String explanation;

    if (waterTemperature >= 20.0 &&
        waterTemperature <= 24.0) {
      score = 100;
      explanation =
      'Water temperature is within the optimal range for many South African surf species.';
    } else if (waterTemperature >= 18.0 &&
        waterTemperature < 20.0) {
      score = 80;
      explanation =
      'Water temperature is favourable and should support feeding activity.';
    } else if (waterTemperature > 24.0 &&
        waterTemperature <= 26.0) {
      score = 75;
      explanation =
      'Water temperature is warm but remains suitable for many coastal species.';
    } else if (waterTemperature >= 16.0 &&
        waterTemperature < 18.0) {
      score = 60;
      explanation =
      'Cooler water may reduce activity for some species while benefiting others.';
    } else {
      score = 40;
      explanation =
      'Water temperature is outside the preferred range for many surf species.';
    }

    return IntelligenceFactor(
      name: 'Water Temperature',
      observedValue:
      '${waterTemperature.toStringAsFixed(1)} °C',
      idealValue: '20.0–24.0 °C',
      score: score,
      weight: 0.15,
      confidence: ConfidenceLevel.high,
      explanation: explanation,
    );
  }
}