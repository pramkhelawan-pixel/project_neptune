import 'dart:math' as math;

import '../entities/length_unit.dart';
import '../entities/length_weight_coefficients.dart';
import '../entities/length_weight_estimate.dart';

/// Applies `W = a * L^b` for a given species' [LengthWeightCoefficients].
///
/// Pure, synchronous, fully local -- no network, no Supabase, no platform
/// channel. The only inputs are a hardcoded, cited coefficients record and
/// a user-entered length.
class LengthWeightCalculator {
  const LengthWeightCalculator();

  LengthWeightEstimate calculate({
    required LengthWeightCoefficients coefficients,
    required double length,
    required LengthUnit unit,
  }) {
    final lengthCm = unit.toCentimetres(length);

    if (length <= 0 || lengthCm.isNaN || lengthCm.isInfinite) {
      return LengthWeightEstimate(
        outcome: LengthWeightEstimateOutcome.invalidLength,
        coefficients: coefficients,
        lengthCm: lengthCm,
      );
    }

    if (lengthCm < coefficients.minValidatedLengthCm) {
      return LengthWeightEstimate(
        outcome: LengthWeightEstimateOutcome.belowValidatedRange,
        coefficients: coefficients,
        lengthCm: lengthCm,
      );
    }

    if (lengthCm > coefficients.maxValidatedLengthCm) {
      return LengthWeightEstimate(
        outcome: LengthWeightEstimateOutcome.aboveValidatedRange,
        coefficients: coefficients,
        lengthCm: lengthCm,
      );
    }

    final grams = coefficients.a * math.pow(lengthCm, coefficients.b);

    return LengthWeightEstimate(
      outcome: LengthWeightEstimateOutcome.success,
      coefficients: coefficients,
      lengthCm: lengthCm,
      estimatedWeightGrams: grams.toDouble(),
    );
  }
}
