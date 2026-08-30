import 'length_weight_coefficients.dart';

/// Why a [LengthWeightEstimate] does or doesn't carry a weight.
enum LengthWeightEstimateOutcome {
  /// A weight was calculated -- the entered length was valid and fell
  /// within the source study's validated range.
  success,

  /// The entered length converts to a value below the study's validated
  /// range. No weight is calculated -- showing one would extrapolate.
  belowValidatedRange,

  /// The entered length converts to a value above the study's validated
  /// range. No weight is calculated -- showing one would extrapolate.
  aboveValidatedRange,

  /// The entered length was not a valid positive number.
  invalidLength,
}

/// The result of applying a [LengthWeightCoefficients] equation to one
/// user-entered length.
class LengthWeightEstimate {
  final LengthWeightEstimateOutcome outcome;
  final LengthWeightCoefficients coefficients;

  /// The entered length, normalised to centimetres. Populated even when
  /// [outcome] isn't [LengthWeightEstimateOutcome.success], so the UI can
  /// show the range-check message against the actual value used.
  final double lengthCm;

  /// Only non-null when [outcome] is
  /// [LengthWeightEstimateOutcome.success].
  final double? estimatedWeightGrams;

  const LengthWeightEstimate({
    required this.outcome,
    required this.coefficients,
    required this.lengthCm,
    this.estimatedWeightGrams,
  });

  bool get isSuccess => outcome == LengthWeightEstimateOutcome.success;

  double? get estimatedWeightKg {
    final grams = estimatedWeightGrams;
    return grams == null ? null : grams / 1000;
  }
}
