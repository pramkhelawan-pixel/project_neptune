// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: fish_species.dart
//
// Purpose:
// Represents a fish species recognised by Neptune.
//
// Future versions will include biological characteristics,
// seasonal migrations, preferred habitats and environmental preferences.
// -----------------------------------------------------------------------------

/// Represents a fish species.
class FishSpecies {
  /// Unique identifier.
  final String id;

  /// Common display name.
  final String commonName;

  /// Scientific name.
  final String scientificName;

  /// Indicates whether the species is primarily targeted from the surf.
  final bool isSurfSpecies;

  const FishSpecies({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.isSurfSpecies,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FishSpecies &&
            id == other.id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return commonName;
  }
}