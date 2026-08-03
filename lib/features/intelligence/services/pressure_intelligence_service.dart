// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: pressure_intelligence_service.dart
//
// Purpose:
// Evaluates atmospheric pressure and produces a canonical IntelligenceFactor.
//
// Stable and rising pressure generally supports favourable fishing conditions.
// This service contributes its assessment to Neptune's overall Fishing
// Intelligence.
//
// -----------------------------------------------------------------------------

import '../../knowledge/domain/enums/confidence_level.dart';
import '../domain/entities/intelligence_factor.dart';

class PressureIntelligenceService {
  const PressureIntelligenceService();

  IntelligenceFactor evaluate({
    required double pressure,
  }) {
    double score;
    String explanation;

    if (pressure >= 1015 && pressure <= 1025) {
      score = 100;
      explanation =
      'High, stable atmospheric pressure is generally associated with favourable fishing conditions.';
    } else if (pressure >= 1010 && pressure < 1015) {
      score = 80;
      explanation =
      'Moderately high pressure often supports good fishing activity.';
    } else if (pressure >= 1005 && pressure < 1010) {
      score = 65;
      explanation =
      'Average atmospheric pressure may produce variable fishing conditions.';
    } else {
      score = 40;
      explanation =
      'Low atmospheric pressure is generally associated with less predictable fishing conditions.';
    }

    return IntelligenceFactor(
      name: 'Pressure',
      observedValue: '${pressure.toStringAsFixed(1)} hPa',
      idealValue: '1015–1025 hPa',
      score: score,
      weight: 0.15,
      confidence: ConfidenceLevel.high,
      explanation: explanation,
    );
  }
}