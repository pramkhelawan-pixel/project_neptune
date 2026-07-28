// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_record.dart
// Purpose:
// Base entity for every knowledge item in the Neptune Knowledge Repository.
//
// Every specialised knowledge model either extends or composes this entity.
// -----------------------------------------------------------------------------

import '../enums/confidence_level.dart';
import '../enums/evidence_level.dart';
import '../enums/knowledge_category.dart';

/// Represents a single knowledge record within the Neptune Knowledge Repository.
///
/// This is the foundation for all structured knowledge used throughout Neptune,
/// including species, bait, traces, knots, beaches, techniques and equipment.
class KnowledgeRecord {
  /// Unique identifier.
  final String id;

  /// Primary knowledge category.
  final KnowledgeCategory category;

  /// Display title.
  final String title;

  /// Full description.
  final String description;

  /// Source of the knowledge.
  final EvidenceLevel evidenceLevel;

  /// Confidence in the knowledge.
  final ConfidenceLevel confidenceLevel;

  /// Search tags.
  final List<String> tags;

  /// Applicable South African regions.
  final List<String> regions;

  /// Related target species.
  final List<String> targetSpecies;

  /// Premium content flag.
  final bool premium;

  /// Indicates that this knowledge has been verified.
  final bool verified;

  /// Record creation date.
  final DateTime createdAt;

  /// Last modification date.
  final DateTime updatedAt;

  const KnowledgeRecord({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.evidenceLevel,
    required this.confidenceLevel,
    this.tags = const [],
    this.regions = const [],
    this.targetSpecies = const [],
    this.premium = false,
    this.verified = false,
    required this.createdAt,
    required this.updatedAt,
  });

  KnowledgeRecord copyWith({
    String? id,
    KnowledgeCategory? category,
    String? title,
    String? description,
    EvidenceLevel? evidenceLevel,
    ConfidenceLevel? confidenceLevel,
    List<String>? tags,
    List<String>? regions,
    List<String>? targetSpecies,
    bool? premium,
    bool? verified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return KnowledgeRecord(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      description: description ?? this.description,
      evidenceLevel: evidenceLevel ?? this.evidenceLevel,
      confidenceLevel: confidenceLevel ?? this.confidenceLevel,
      tags: tags ?? this.tags,
      regions: regions ?? this.regions,
      targetSpecies: targetSpecies ?? this.targetSpecies,
      premium: premium ?? this.premium,
      verified: verified ?? this.verified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'KnowledgeRecord(id: $id, title: $title, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KnowledgeRecord && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}