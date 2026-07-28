// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: species_profile.dart
// Purpose:
// Defines a structured profile for a fish species within the Neptune Knowledge
// Repository (NKR).
// -----------------------------------------------------------------------------

import 'knowledge_metadata.dart';
import 'knowledge_record.dart';
import 'knowledge_reference.dart';

/// Represents a complete species profile used by Neptune.
///
/// This entity extends the base knowledge model through composition,
/// allowing species-specific information to evolve independently.
class SpeciesProfile {
  /// Core knowledge record.
  final KnowledgeRecord record;

  /// Lifecycle metadata.
  final KnowledgeMetadata metadata;

  /// Supporting references.
  final List<KnowledgeReference> references;

  /// Scientific (Latin) name.
  final String scientificName;

  /// Common South African name.
  final String commonName;

  /// Typical habitat.
  final List<String> habitats;

  /// Preferred bait.
  final List<String> preferredBaits;

  /// Recommended traces.
  final List<String> recommendedTraces;

  /// Recommended hook sizes.
  final List<String> recommendedHooks;

  /// Best fishing seasons.
  final List<String> seasons;

  /// Regions where commonly found.
  final List<String> distribution;

  /// Conservation notes.
  final String conservation;

  const SpeciesProfile({
    required this.record,
    required this.metadata,
    this.references = const [],
    required this.scientificName,
    required this.commonName,
    this.habitats = const [],
    this.preferredBaits = const [],
    this.recommendedTraces = const [],
    this.recommendedHooks = const [],
    this.seasons = const [],
    this.distribution = const [],
    this.conservation = '',
  });

  SpeciesProfile copyWith({
    KnowledgeRecord? record,
    KnowledgeMetadata? metadata,
    List<KnowledgeReference>? references,
    String? scientificName,
    String? commonName,
    List<String>? habitats,
    List<String>? preferredBaits,
    List<String>? recommendedTraces,
    List<String>? recommendedHooks,
    List<String>? seasons,
    List<String>? distribution,
    String? conservation,
  }) {
    return SpeciesProfile(
      record: record ?? this.record,
      metadata: metadata ?? this.metadata,
      references: references ?? this.references,
      scientificName: scientificName ?? this.scientificName,
      commonName: commonName ?? this.commonName,
      habitats: habitats ?? this.habitats,
      preferredBaits: preferredBaits ?? this.preferredBaits,
      recommendedTraces: recommendedTraces ?? this.recommendedTraces,
      recommendedHooks: recommendedHooks ?? this.recommendedHooks,
      seasons: seasons ?? this.seasons,
      distribution: distribution ?? this.distribution,
      conservation: conservation ?? this.conservation,
    );
  }

  @override
  String toString() {
    return 'SpeciesProfile(commonName: $commonName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpeciesProfile &&
        other.record.id == record.id;
  }

  @override
  int get hashCode => record.id.hashCode;
}