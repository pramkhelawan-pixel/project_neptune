// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: wind_conditions.dart
//
// Purpose:
// Immutable value object representing observed wind conditions.
//
// WindConditions forms part of Neptune's canonical Marine Domain and is
// consumed by the Intelligence Engine when evaluating fishing conditions.
//
// -----------------------------------------------------------------------------

class WindConditions {
  /// Wind speed in kilometres per hour.
  final double speed;

  /// Wind direction (e.g. N, NE, E, SE, S, SW, W, NW).
  final String direction;

  /// Maximum observed wind gust in kilometres per hour.
  final double gust;

  const WindConditions({
    required this.speed,
    required this.direction,
    required this.gust,
  });

  /// Returns true when gusts exceed the sustained wind speed.
  bool get hasGusts => gust > speed;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WindConditions &&
        other.speed == speed &&
        other.direction == direction &&
        other.gust == gust;
  }

  @override
  int get hashCode => Object.hash(
    speed,
    direction,
    gust,
  );

  @override
  String toString() {
    return 'WindConditions('
        'speed: $speed km/h, '
        'direction: $direction, '
        'gust: $gust km/h'
        ')';
  }
}