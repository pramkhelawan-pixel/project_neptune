// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: intelligence_engine.dart
//
// Purpose:
// Combines individual intelligence factors into a single FishingIntelligence
// assessment.
//
// This service is the central orchestration point of Neptune's Intelligence
// feature. Environmental evaluators contribute IntelligenceFactor instances,
// which are aggregated into a weighted score and overall rating.
// -----------------------------------------------------------------------------

import '../domain/entities/fishing_intelligence.dart';
import '../domain/entities/intelligence_factor.dart';
import '../domain/enums/intelligence_rating.dart';
import '../domain/value_objects/intelligence_explanation.dart';
import '../domain/value_objects/intelligence_score.dart';

class IntelligenceEngine {
  const IntelligenceEngine();

  FishingIntelligence evaluate(
      List<IntelligenceFactor> factors,
      ) {
    if (factors.isEmpty) {
      return const FishingIntelligence(
        score: IntelligenceScore(0),
        rating: IntelligenceRating.poor,
        explanation: IntelligenceExplanation(
          reasons: [
            'No intelligence factors were available.',
          ],
        ),
      );
    }

    final total = factors.fold<double>(
      0.0,
          (sum, factor) => sum + factor.score,
    );

    final average = (total / factors.length).round();

    final rating = switch (average) {
      >= 90 => IntelligenceRating.excellent,
      >= 80 => IntelligenceRating.veryGood,
      >= 70 => IntelligenceRating.good,
      >= 50 => IntelligenceRating.fair,
      _ => IntelligenceRating.poor,
    };

    return FishingIntelligence(
      score: IntelligenceScore(average),
      rating: rating,
      explanation: IntelligenceExplanation(
        reasons: factors
            .map((factor) => factor.explanation)
            .toList(growable: false),
      ),
    );
  }
}