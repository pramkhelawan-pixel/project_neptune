// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: recommendation_score.dart
//
// Purpose:
// Represents Neptune's overall recommendation score.
//
// This entity encapsulates the calculated recommendation score produced by
// the Recommendation Engine. It provides convenience properties for checking
// score quality and ensures values remain within the valid operating range.
//
// Future versions will support weighted scoring, machine learning adjustments,
// historical calibration and adaptive confidence modelling.
// -----------------------------------------------------------------------------

/// Represents Neptune's overall recommendation score.
class RecommendationScore {
  /// Recommendation score (0–100).
  final double value;

  /// Creates an immutable recommendation score.
  const RecommendationScore(this.value);

  /// Returns the score clamped to the valid range.
  double get normalized {
    if (value < 0) {
      return 0;
    }

    if (value > 100) {
      return 100;
    }

    return value;
  }

  /// Indicates excellent conditions.
  bool get isExcellent => normalized >= 90;

  /// Indicates good conditions.
  bool get isGood => normalized >= 75 && normalized < 90;

  /// Indicates fair conditions.
  bool get isFair => normalized >= 55 && normalized < 75;

  /// Indicates poor conditions.
  bool get isPoor => normalized >= 35 && normalized < 55;

  /// Indicates fishing is not recommended.
  bool get isNotRecommended => normalized < 35;

  /// Returns a copy with an updated value.
  RecommendationScore copyWith({
    double? value,
  }) {
    return RecommendationScore(
      value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is RecommendationScore &&
        other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'RecommendationScore(value: $normalized)';
  }
}