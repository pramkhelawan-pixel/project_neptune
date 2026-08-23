// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: lunar_conditions.dart
//
// Purpose:
// Immutable value object representing observed lunar conditions.
//
// LunarConditions forms part of Neptune's canonical Marine Domain and is
// consumed by the Intelligence Engine when evaluating fishing conditions.
//
// -----------------------------------------------------------------------------

import '../../../lunar/domain/solunar_period.dart';

import '../enums/moon_phase.dart';

class LunarConditions {
  /// Current moon phase.
  final MoonPhase phase;

  /// Moon illumination percentage.
  final double illumination;

  /// Locally-calculated moonrise for the observation date/location. Null
  /// when the Moon does not rise that day (possible at high latitudes).
  final DateTime? moonrise;

  /// Locally-calculated moonset for the observation date/location. Null
  /// when the Moon does not set that day (possible at high latitudes).
  final DateTime? moonset;

  /// Solunar major feeding periods (moon transit and antitransit ± 1h).
  /// Always two entries.
  final List<SolunarPeriod> majorPeriods;

  /// Solunar minor feeding periods (moonrise and moonset ± 1h). Zero, one,
  /// or two entries depending on which events occur that day.
  final List<SolunarPeriod> minorPeriods;

  const LunarConditions({
    required this.phase,
    required this.illumination,
    this.moonrise,
    this.moonset,
    this.majorPeriods = const [],
    this.minorPeriods = const [],
  });

  /// Returns true when the moon is new.
  bool get isNewMoon => phase.isNew;

  /// Returns true when the moon is full.
  bool get isFullMoon => phase.isFull;

  /// Returns true when the moon is waxing.
  bool get isWaxing => phase.isWaxing;

  /// Returns true when the moon is waning.
  bool get isWaning => phase.isWaning;

  /// Returns true when illumination exceeds 90%.
  bool get isHighlyIlluminated => illumination >= 90.0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LunarConditions &&
        other.phase == phase &&
        other.illumination == illumination &&
        other.moonrise == moonrise &&
        other.moonset == moonset &&
        _periodsEqual(other.majorPeriods, majorPeriods) &&
        _periodsEqual(other.minorPeriods, minorPeriods);
  }

  @override
  int get hashCode => Object.hash(
    phase,
    illumination,
    moonrise,
    moonset,
    Object.hashAll(majorPeriods),
    Object.hashAll(minorPeriods),
  );

  static bool _periodsEqual(
    List<SolunarPeriod> a,
    List<SolunarPeriod> b,
  ) {
    if (a.length != b.length) return false;

    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }

    return true;
  }

  @override
  String toString() {
    return 'LunarConditions('
        'phase: ${phase.displayName}, '
        'illumination: ${illumination.toStringAsFixed(0)}%, '
        'moonrise: $moonrise, '
        'moonset: $moonset'
        ')';
  }
}