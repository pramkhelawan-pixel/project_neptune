// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: fishing_intelligence.dart
//
// Purpose:
// Canonical domain entity representing Neptune's overall fishing intelligence
// assessment.
//
// This entity is the authoritative output of the Neptune Intelligence Engine.
// It combines environmental analysis into a single domain object that can be
// consumed by the Recommendation Engine, AI services and presentation layer.
//
// -----------------------------------------------------------------------------

import '../enums/intelligence_rating.dart';
import '../value_objects/intelligence_explanation.dart';
import '../value_objects/intelligence_score.dart';

class FishingIntelligence {
  /// Overall weighted intelligence score (0–100).
  final IntelligenceScore score;

  /// Overall intelligence classification.
  final IntelligenceRating rating;

  /// Human-readable explanation of the assessment.
  final IntelligenceExplanation explanation;

  const FishingIntelligence({
    required this.score,
    required this.rating,
    required this.explanation,
  });
}