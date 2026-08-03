// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: cloud_cover.dart
//
// Purpose:
// Defines the canonical cloud cover categories used throughout Neptune.
//
// This enum replaces raw values and provides compile-time safety,
// consistent terminology and reusable behaviour.
//
// -----------------------------------------------------------------------------

enum CloudCover {
  clear(
    displayName: 'Clear',
  ),

  mostlyClear(
    displayName: 'Mostly Clear',
  ),

  partlyCloudy(
    displayName: 'Partly Cloudy',
  ),

  mostlyCloudy(
    displayName: 'Mostly Cloudy',
  ),

  overcast(
    displayName: 'Overcast',
  );

  /// Human-readable description.
  final String displayName;

  const CloudCover({
    required this.displayName,
  });

  /// True when little or no cloud is present.
  bool get isClear =>
      this == CloudCover.clear ||
          this == CloudCover.mostlyClear;

  /// True when cloud is moderate.
  bool get isPartial =>
      this == CloudCover.partlyCloudy;

  /// True when cloud cover is extensive.
  bool get isOvercast =>
      this == CloudCover.overcast ||
          this == CloudCover.mostlyCloudy;

  @override
  String toString() => displayName;
}