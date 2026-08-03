// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: current_intelligence_service.dart
//
// Purpose:
// Evaluates water current strength and produces a canonical
// IntelligenceFactor.
//
// Water current influences baitfish movement, oxygenation and predator
// behaviour. This service contributes its assessment to Neptune's overall
// Fishing Intelligence.
//
// -----------------------------------------------------------------------------

import '../../knowledge/domain/enums/confidence_level.dart';
import '../domain/entities/intelligence_factor.dart';

class CurrentIntelligenceService {
  const CurrentIntelligenceService();

  IntelligenceFactor evaluate({
    required double currentSpeed,
  }) {
    double score;
    String explanation;

    if (currentSpeed >= 0.5 && currentSpeed <= 1.5) {
      score = 100;
      explanation =
      'Moderate water current promotes bait movement and favourable feeding activity.';
    } else if (currentSpeed > 1.5 && currentSpeed <= 2.5) {
      score = 80;
      explanation =
      'Strong current can still provide productive fishing opportunities.';
    } else if (currentSpeed >= 0.2 && currentSpeed < 0.5) {
      score = 65;
      explanation =
      'Light current provides some water movement but may reduce feeding activity.';
    } else {
      score = 40;
      explanation =
      'Current strength is outside the preferred range for many surf fishing situations.';
    }

    return IntelligenceFactor(
      name: 'Current',
      observedValue: '${currentSpeed.toStringAsFixed(1)} knots',
      idealValue: '0.5–1.5 knots',
      score: score,
      weight: 0.10,
      confidence: ConfidenceLevel.high,
      explanation: explanation,
    );
  }
}