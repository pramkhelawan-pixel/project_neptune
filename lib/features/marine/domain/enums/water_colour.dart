// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: water_colour.dart
//
// Purpose:
// Defines the canonical water colours used throughout Neptune.
//
// This enum replaces raw String values and provides compile-time safety,
// consistent terminology and reusable behaviour.
//
// -----------------------------------------------------------------------------

enum WaterColour {
  crystalClear(
    displayName: 'Crystal Clear',
  ),

  blue(
    displayName: 'Blue',
  ),

  blueGreen(
    displayName: 'Blue-Green',
  ),

  green(
    displayName: 'Green',
  ),

  brownGreen(
    displayName: 'Brown-Green',
  ),

  brown(
    displayName: 'Brown',
  ),

  dirty(
    displayName: 'Dirty',
  );

  /// Human-readable description.
  final String displayName;

  const WaterColour({
    required this.displayName,
  });

  /// Returns true when visibility is generally excellent.
  bool get isVeryClean =>
      this == WaterColour.crystalClear ||
          this == WaterColour.blue;

  /// Returns true when conditions are generally favourable.
  bool get isFishable =>
      this == WaterColour.blueGreen ||
          this == WaterColour.green;

  /// Returns true when visibility is poor.
  bool get isDirty =>
      this == WaterColour.brown ||
          this == WaterColour.dirty;

  @override
  String toString() => displayName;
}