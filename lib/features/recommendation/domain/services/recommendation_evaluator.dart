// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: recommendation_evaluator.dart
//
// Purpose:
// Defines the common contract implemented by all recommendation evaluators.
//
// Every evaluator analyses a single environmental factor and returns an
// evaluation result that contributes towards Neptune's final recommendation.
//
// Future versions will allow evaluators to be dynamically registered,
// prioritised and configured.
// -----------------------------------------------------------------------------

import '../../../marine/domain/models/marine_conditions.dart';

/// Defines the contract for all recommendation evaluators.
abstract interface class RecommendationEvaluator<T> {
  /// Evaluates the supplied marine conditions.
  T evaluate(
      MarineConditions marine,
      );
}