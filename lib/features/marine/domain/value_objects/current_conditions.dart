// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: current_conditions.dart
//
// Purpose:
// Immutable value object representing observed ocean current conditions.
//
// CurrentConditions forms part of Neptune's canonical Marine Domain and is
// consumed by the Intelligence Engine when evaluating fishing conditions.
//
// -----------------------------------------------------------------------------

class CurrentConditions {
  /// Current speed in knots.
  final double speed;

  /// Current direction.
  ///
  /// Examples:
  /// N, NE, E, SE, S, SW, W, NW.
  final String direction;

  const CurrentConditions({
    required this.speed,
    required this.direction,
  });

  /// Returns true when the current is weak.
  bool get isWeak => speed < 0.5;

  /// Returns true when the current is moderate.
  bool get isModerate => speed >= 0.5 && speed <= 1.5;

  /// Returns true when the current is strong.
  bool get isStrong => speed > 1.5;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentConditions &&
        other.speed == speed &&
        other.direction == direction;
  }

  @override
  int get hashCode => Object.hash(
    speed,
    direction,
  );

  @override
  String toString() {
    return 'CurrentConditions('
        'speed: ${speed.toStringAsFixed(1)} knots, '
        'direction: $direction'
        ')';
  }
}