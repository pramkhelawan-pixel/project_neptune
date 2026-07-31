// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: recommendation_breakdown.dart
//
// Purpose:
// Represents the complete breakdown of Neptune's recommendation score.
//
// Rather than storing only the final recommendation score, this entity records
// the contribution made by each environmental evaluator. This allows Neptune
// to explain why a recommendation was produced and provides the foundation for
// future analytics, AI explainability and historical learning.
// -----------------------------------------------------------------------------

/// Represents Neptune's recommendation score breakdown.
class RecommendationBreakdown {
  /// Final recommendation score.
  final int total;

  /// Wind contribution.
  final int wind;

  /// Swell contribution.
  final int swell;

  /// Tide contribution.
  final int tide;

  /// Atmospheric pressure contribution.
  final int pressure;

  /// Moon contribution.
  final int moon;

  const RecommendationBreakdown({
    required this.total,
    required this.wind,
    required this.swell,
    required this.tide,
    required this.pressure,
    required this.moon,
  });

  /// Returns the total positive contribution.
  int get positiveContribution =>
      [wind, swell, tide, pressure, moon]
          .where((value) => value > 0)
          .fold(0, (sum, value) => sum + value);

  /// Returns the total negative contribution.
  int get negativeContribution =>
      [wind, swell, tide, pressure, moon]
          .where((value) => value < 0)
          .fold(0, (sum, value) => sum + value);

  RecommendationBreakdown copyWith({
    int? total,
    int? wind,
    int? swell,
    int? tide,
    int? pressure,
    int? moon,
  }) {
    return RecommendationBreakdown(
      total: total ?? this.total,
      wind: wind ?? this.wind,
      swell: swell ?? this.swell,
      tide: tide ?? this.tide,
      pressure: pressure ?? this.pressure,
      moon: moon ?? this.moon,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RecommendationBreakdown &&
            total == other.total &&
            wind == other.wind &&
            swell == other.swell &&
            tide == other.tide &&
            pressure == other.pressure &&
            moon == other.moon;
  }

  @override
  int get hashCode => Object.hash(
    total,
    wind,
    swell,
    tide,
    pressure,
    moon,
  );

  @override
  String toString() {
    return 'RecommendationBreakdown('
        'total: $total, '
        'wind: $wind, '
        'swell: $swell, '
        'tide: $tide, '
        'pressure: $pressure, '
        'moon: $moon'
        ')';
  }
}