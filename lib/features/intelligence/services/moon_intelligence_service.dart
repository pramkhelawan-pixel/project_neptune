// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: moon_intelligence_service.dart
//
// Purpose:
// Evaluates lunar phase and produces a canonical IntelligenceFactor.
//
// Lunar phase influences tidal movement and feeding behaviour for many coastal
// species. This service contributes its assessment to Neptune's overall
// Fishing Intelligence.
//
// -----------------------------------------------------------------------------

import '../../knowledge/domain/enums/confidence_level.dart';
import '../domain/entities/intelligence_factor.dart';

class MoonIntelligenceService {
  const MoonIntelligenceService();

  IntelligenceFactor evaluate({
    required String moonPhase,
  }) {
    final phase = moonPhase.trim().toLowerCase();

    double score;
    String explanation;

    switch (phase) {
      case 'new moon':
        score = 100;
        explanation =
        'New Moon generally produces strong tidal movement and favourable fishing conditions.';
        break;

      case 'full moon':
        score = 95;
        explanation =
        'Full Moon often creates excellent tidal movement and increased feeding activity.';
        break;

      case 'first quarter':
        score = 75;
        explanation =
        'First Quarter Moon may still provide productive fishing conditions.';
        break;

      case 'last quarter':
        score = 70;
        explanation =
        'Last Quarter Moon provides moderate fishing potential.';
        break;

      case 'waxing crescent':
      case 'waxing gibbous':
      case 'waning gibbous':
      case 'waning crescent':
        score = 60;
        explanation =
        'Intermediate lunar phases generally provide average fishing conditions.';
        break;

      default:
        score = 50;
        explanation =
        'Moon phase could not be fully evaluated.';
    }

    return IntelligenceFactor(
      name: 'Moon',
      observedValue: moonPhase,
      idealValue: 'New Moon or Full Moon',
      score: score,
      weight: 0.10,
      confidence: ConfidenceLevel.high,
      explanation: explanation,
    );
  }
}