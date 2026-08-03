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

import '../enums/moon_phase.dart';

class LunarConditions {
  /// Current moon phase.
  final MoonPhase phase;

  /// Moon illumination percentage.
  final double illumination;

  const LunarConditions({
    required this.phase,
    required this.illumination,
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
        other.illumination == illumination;
  }

  @override
  int get hashCode => Object.hash(
    phase,
    illumination,
  );

  @override
  String toString() {
    return 'LunarConditions('
        'phase: ${phase.displayName}, '
        'illumination: ${illumination.toStringAsFixed(0)}%'
        ')';
  }
}