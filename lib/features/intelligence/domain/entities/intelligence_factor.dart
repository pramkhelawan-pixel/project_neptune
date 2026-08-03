// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: intelligence_factor.dart
//
// Purpose:
// Canonical domain entity representing a single contributor to Neptune's
// Fishing Intelligence assessment.
//
// Every environmental evaluator (wind, tide, moon, pressure, swell,
// temperature, current, etc.) produces exactly one IntelligenceFactor.
//
// -----------------------------------------------------------------------------

import '../../../knowledge/domain/enums/confidence_level.dart';

class IntelligenceFactor {
  /// Name of the evaluated factor.
  final String name;

  /// Actual observed value.
  final String observedValue;

  /// Ideal value or operating range.
  final String idealValue;

  /// Score contribution (0–100).
  final double score;

  /// Relative weighting (0.0–1.0).
  final double weight;

  /// Confidence in the evaluation.
  final ConfidenceLevel confidence;

  /// Human-readable explanation.
  final String explanation;

  const IntelligenceFactor({
    required this.name,
    required this.observedValue,
    required this.idealValue,
    required this.score,
    required this.weight,
    required this.confidence,
    required this.explanation,
  });
}