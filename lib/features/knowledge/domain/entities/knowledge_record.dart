// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_record.dart
//
// Purpose:
// Canonical domain entity representing a single knowledge record within the
// Neptune Knowledge Repository.
//
// This entity is the authoritative knowledge model for the entire platform.
// All repositories, services, recommendation engines and AI components operate
// exclusively on this model.
//
// STD-005:
// This entity is part of Neptune's Canonical Domain and shall only be modified
// through an approved architecture decision.
// -----------------------------------------------------------------------------

import 'knowledge_source.dart';

import '../enums/confidence_level.dart';
import '../enums/evidence_level.dart';
import '../enums/knowledge_category.dart';

/// Represents a single structured knowledge record within Neptune.
class KnowledgeRecord {
  // ---------------------------------------------------------------------------
  // Identity
  // ---------------------------------------------------------------------------

  /// Globally unique knowledge identifier.
  final String id;

  // ---------------------------------------------------------------------------
  // Species
  // ---------------------------------------------------------------------------

  /// Primary species associated with this knowledge.
  ///
  /// May be null for generic knowledge such as knots, safety,
  /// regulations or equipment.
  final String? species;

  /// All species applicable to this knowledge.
  ///
  /// Normally contains the primary species but may contain multiple
  /// species for generic knowledge.
  final List<String> targetSpecies;

  // ---------------------------------------------------------------------------
  // Classification
  // ---------------------------------------------------------------------------

  /// Primary knowledge category.
  final KnowledgeCategory category;

  // ---------------------------------------------------------------------------
  // Content
  // ---------------------------------------------------------------------------

  /// Display title.
  final String title;

  /// Detailed knowledge description.
  final String description;

  // ---------------------------------------------------------------------------
  // Knowledge Quality
  // ---------------------------------------------------------------------------

  /// Evidence supporting this knowledge.
  final EvidenceLevel evidenceLevel;

  /// Neptune confidence assessment.
  final ConfidenceLevel confidenceLevel;

  /// Supporting references.
  final List<KnowledgeSource> sources;

  // ---------------------------------------------------------------------------
  // Search Metadata
  // ---------------------------------------------------------------------------

  /// Geographic regions where this knowledge applies.
  final List<String> regions;

  /// Applicable fishing seasons.
  final List<String> seasons;

  /// Search keywords.
  final List<String> tags;

  // ---------------------------------------------------------------------------
  // Commercial
  // ---------------------------------------------------------------------------

  /// Premium content indicator.
  final bool premium;

  /// Indicates the knowledge has been reviewed and approved.
  final bool verified;

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  const KnowledgeRecord({
    required this.id,
    this.species,
    this.targetSpecies = const [],
    required this.category,
    required this.title,
    required this.description,
    required this.evidenceLevel,
    required this.confidenceLevel,
    this.sources = const [],
    this.regions = const [],
    this.seasons = const [],
    this.tags = const [],
    this.premium = false,
    this.verified = false,
    required this.createdAt,
    required this.updatedAt,
  });

  KnowledgeRecord copyWith({
    String? id,
    String? species,
    List<String>? targetSpecies,
    KnowledgeCategory? category,
    String? title,
    String? description,
    EvidenceLevel? evidenceLevel,
    ConfidenceLevel? confidenceLevel,
    List<KnowledgeSource>? sources,
    List<String>? regions,
    List<String>? seasons,
    List<String>? tags,
    bool? premium,
    bool? verified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return KnowledgeRecord(
      id: id ?? this.id,
      species: species ?? this.species,
      targetSpecies: targetSpecies ?? this.targetSpecies,
      category: category ?? this.category,
      title: title ?? this.title,
      description: description ?? this.description,
      evidenceLevel: evidenceLevel ?? this.evidenceLevel,
      confidenceLevel: confidenceLevel ?? this.confidenceLevel,
      sources: sources ?? this.sources,
      regions: regions ?? this.regions,
      seasons: seasons ?? this.seasons,
      tags: tags ?? this.tags,
      premium: premium ?? this.premium,
      verified: verified ?? this.verified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'KnowledgeRecord('
        'id: $id, '
        'species: $species, '
        'title: $title, '
        'category: $category'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is KnowledgeRecord && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}