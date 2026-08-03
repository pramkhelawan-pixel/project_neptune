// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: swell_conditions.dart
//
// Purpose:
// Immutable value object representing observed swell conditions.
//
// SwellConditions forms part of Neptune's canonical Marine Domain and is
// consumed by the Intelligence Engine when evaluating fishing conditions.
//
// -----------------------------------------------------------------------------

class SwellConditions {
  /// Swell height in metres.
  final double height;

  /// Swell period in seconds.
  final double period;

  /// Swell direction.
  ///
  /// Examples:
  /// N, NE, E, SE, S, SW, W, NW.
  final String direction;

  const SwellConditions({
    required this.height,
    required this.period,
    required this.direction,
  });

  /// Returns true when swell is generally considered small.
  bool get isSmall => height < 1.0;

  /// Returns true when swell is moderate.
  bool get isModerate => height >= 1.0 && height <= 2.5;

  /// Returns true when swell is large.
  bool get isLarge => height > 2.5;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SwellConditions &&
        other.height == height &&
        other.period == period &&
        other.direction == direction;
  }

  @override
  int get hashCode => Object.hash(
    height,
    period,
    direction,
  );

  @override
  String toString() {
    return 'SwellConditions('
        'height: ${height.toStringAsFixed(2)} m, '
        'period: ${period.toStringAsFixed(1)} s, '
        'direction: $direction'
        ')';
  }
}