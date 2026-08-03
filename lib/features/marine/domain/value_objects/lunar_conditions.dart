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

class LunarConditions {
  /// Current moon phase.
  ///
  /// Examples:
  /// - New Moon
  /// - Waxing Crescent
  /// - First Quarter
  /// - Waxing Gibbous
  /// - Full Moon
  /// - Waning Gibbous
  /// - Last Quarter
  /// - Waning Crescent
  final String phase;

  /// Moon illumination percentage.
  final double illumination;

  const LunarConditions({
    required this.phase,
    required this.illumination,
  });

  /// Returns true when the moon is new.
  bool get isNewMoon =>
      phase.toLowerCase() == 'new moon';

  /// Returns true when the moon is full.
  bool get isFullMoon =>
      phase.toLowerCase() == 'full moon';

  /// Returns true when illumination exceeds 90%.
  bool get isHighlyIlluminated =>
      illumination >= 90.0;

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
        'phase: $phase, '
        'illumination: ${illumination.toStringAsFixed(0)}%'
        ')';
  }
}