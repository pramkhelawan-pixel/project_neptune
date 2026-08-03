// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: wind_direction.dart
//
// Purpose:
// Defines the canonical wind directions used throughout Neptune.
//
// This enum replaces raw String values and provides compile-time safety,
// consistent formatting and reusable behaviour.
//
// -----------------------------------------------------------------------------

enum WindDirection {
  north(
    abbreviation: 'N',
    displayName: 'North',
  ),

  northEast(
    abbreviation: 'NE',
    displayName: 'North East',
  ),

  east(
    abbreviation: 'E',
    displayName: 'East',
  ),

  southEast(
    abbreviation: 'SE',
    displayName: 'South East',
  ),

  south(
    abbreviation: 'S',
    displayName: 'South',
  ),

  southWest(
    abbreviation: 'SW',
    displayName: 'South West',
  ),

  west(
    abbreviation: 'W',
    displayName: 'West',
  ),

  northWest(
    abbreviation: 'NW',
    displayName: 'North West',
  );

  /// Short compass abbreviation.
  final String abbreviation;

  /// Human-readable direction.
  final String displayName;

  const WindDirection({
    required this.abbreviation,
    required this.displayName,
  });

  /// True when the direction has a northern component.
  bool get isNorthern =>
      this == WindDirection.north ||
          this == WindDirection.northEast ||
          this == WindDirection.northWest;

  /// True when the direction has a southern component.
  bool get isSouthern =>
      this == WindDirection.south ||
          this == WindDirection.southEast ||
          this == WindDirection.southWest;

  /// True when the direction has an eastern component.
  bool get isEastern =>
      this == WindDirection.east ||
          this == WindDirection.northEast ||
          this == WindDirection.southEast;

  /// True when the direction has a western component.
  bool get isWestern =>
      this == WindDirection.west ||
          this == WindDirection.northWest ||
          this == WindDirection.southWest;

  @override
  String toString() => displayName;
}