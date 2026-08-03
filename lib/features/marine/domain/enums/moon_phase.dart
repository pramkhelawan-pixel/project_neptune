// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: moon_phase.dart
//
// Purpose:
// Defines the canonical lunar phases used throughout Neptune.
//
// This enum replaces raw String values and provides compile-time safety,
// consistent terminology and reusable behaviour.
//
// -----------------------------------------------------------------------------

enum MoonPhase {
  newMoon(
    displayName: 'New Moon',
  ),

  waxingCrescent(
    displayName: 'Waxing Crescent',
  ),

  firstQuarter(
    displayName: 'First Quarter',
  ),

  waxingGibbous(
    displayName: 'Waxing Gibbous',
  ),

  fullMoon(
    displayName: 'Full Moon',
  ),

  waningGibbous(
    displayName: 'Waning Gibbous',
  ),

  lastQuarter(
    displayName: 'Last Quarter',
  ),

  waningCrescent(
    displayName: 'Waning Crescent',
  );

  /// Human-readable phase.
  final String displayName;

  const MoonPhase({
    required this.displayName,
  });

  /// True when the moon is new.
  bool get isNew => this == MoonPhase.newMoon;

  /// True when the moon is full.
  bool get isFull => this == MoonPhase.fullMoon;

  /// True when the moon is waxing.
  bool get isWaxing =>
      this == MoonPhase.waxingCrescent ||
          this == MoonPhase.firstQuarter ||
          this == MoonPhase.waxingGibbous;

  /// True when the moon is waning.
  bool get isWaning =>
      this == MoonPhase.waningGibbous ||
          this == MoonPhase.lastQuarter ||
          this == MoonPhase.waningCrescent;

  @override
  String toString() => displayName;
}