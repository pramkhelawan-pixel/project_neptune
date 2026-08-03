// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: tide_intelligence_service.dart
//
// Purpose:
// Evaluates tidal conditions and produces a canonical IntelligenceFactor.
//
// This service assesses whether the observed tide is favourable for fishing.
// The resulting IntelligenceFactor contributes to the overall
// FishingIntelligence assessment.
//
// -----------------------------------------------------------------------------

import '../../knowledge/domain/enums/confidence_level.dart';
import '../domain/entities/intelligence_factor.dart';

class TideIntelligenceService {
  const TideIntelligenceService();

  IntelligenceFactor evaluate({
    required String tide,
  }) {
    final normalizedTide = tide.trim().toLowerCase();

    double score;
    String explanation;

    switch (normalizedTide) {
      case 'incoming':
      case 'rising':
      case 'push':
        score = 100;
        explanation =
        'An incoming tide generally improves water movement and feeding activity.';

      case 'high':
        score = 85;
        explanation =
        'High tide often provides favourable access to productive structure.';

      case 'outgoing':
      case 'falling':
        score = 65;
        explanation =
        'An outgoing tide can remain productive depending on location and species.';

      case 'low':
        score = 45;
        explanation =
        'Low tide generally reduces access to productive water in many surf environments.';

      default:
        score = 50;
        explanation =
        'Tidal conditions could not be fully evaluated.';
    }

    return IntelligenceFactor(
      name: 'Tide',
      observedValue: tide,
      idealValue: 'Incoming Tide',
      score: score,
      weight: 0.20,
      confidence: ConfidenceLevel.high,
      explanation: explanation,
    );
  }
}