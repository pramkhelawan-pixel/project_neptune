// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: solar_conditions.dart
//
// Purpose:
// Immutable value object representing observed solar conditions.
//
// SolarConditions forms part of Neptune's canonical Marine Domain and is
// consumed by the Intelligence Engine when evaluating fishing conditions.
//
// -----------------------------------------------------------------------------

class SolarConditions {
  /// Sunrise time.
  final DateTime sunrise;

  /// Sunset time.
  final DateTime sunset;

  const SolarConditions({
    required this.sunrise,
    required this.sunset,
  });

  /// Returns true if the supplied time falls within daylight hours.
  bool isDaylight(DateTime time) {
    return time.isAfter(sunrise) && time.isBefore(sunset);
  }

  /// Returns true if the supplied time falls outside daylight hours.
  bool isNight(DateTime time) {
    return !isDaylight(time);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SolarConditions &&
        other.sunrise == sunrise &&
        other.sunset == sunset;
  }

  @override
  int get hashCode => Object.hash(
    sunrise,
    sunset,
  );

  @override
  String toString() {
    return 'SolarConditions('
        'sunrise: $sunrise, '
        'sunset: $sunset'
        ')';
  }
}