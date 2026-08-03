// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: swell_intelligence_service.dart
//
// Purpose:
// Evaluates swell height and produces a canonical IntelligenceFactor.
//
// This service assesses whether the observed swell is favourable for surf
// fishing and contributes to Neptune's overall Fishing Intelligence.
//
// -----------------------------------------------------------------------------

import '../../knowledge/domain/enums/confidence_level.dart';
import '../domain/entities/intelligence_factor.dart';

class SwellIntelligenceService {
  const SwellIntelligenceService();

  IntelligenceFactor evaluate({
    required double swellHeight,
  }) {
    double score;
    String explanation;

    if (swellHeight >= 1.0 && swellHeight <= 2.0) {
      score = 100;
      explanation =
      'Moderate swell provides favourable surf conditions for many species.';
    } else if (swellHeight > 2.0 && swellHeight <= 3.0) {
      score = 75;
      explanation =
      'Larger swell may still produce good fishing depending on location.';
    } else if (swellHeight >= 0.5 && swellHeight < 1.0) {
      score = 70;
      explanation =
      'Low swell creates calmer conditions but may reduce water movement.';
    } else {
      score = 40;
      explanation =
      'Excessive or minimal swell is generally less favourable.';
    }

    return IntelligenceFactor(
      name: 'Swell',
      observedValue: '${swellHeight.toStringAsFixed(1)} m',
      idealValue: '1.0–2.0 m',
      score: score,
      weight: 0.15,
      confidence: ConfidenceLevel.high,
      explanation: explanation,
    );
  }
}