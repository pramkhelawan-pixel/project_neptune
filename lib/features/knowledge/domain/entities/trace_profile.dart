// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: trace_profile.dart
// Purpose:
// Defines a structured fishing trace profile used throughout the Neptune
// Knowledge Repository.
// -----------------------------------------------------------------------------

import 'knowledge_metadata.dart';
import 'knowledge_record.dart';
import 'knowledge_reference.dart';

/// Represents a complete fishing trace profile.
class TraceProfile {
  /// Core knowledge record.
  final KnowledgeRecord record;

  /// Lifecycle metadata.
  final KnowledgeMetadata metadata;

  /// Supporting references.
  final List<KnowledgeReference> references;

  /// Trace name.
  final String name;

  /// Primary purpose.
  final String purpose;

  /// Recommended target species.
  final List<String> targetSpecies;

  /// Recommended bait.
  final List<String> recommendedBaits;

  /// Recommended hook sizes.
  final List<String> hookSizes;

  /// Leader material.
  final String leaderMaterial;

  /// Leader breaking strain.
  final String leaderStrength;

  /// Typical fishing conditions.
  final List<String> recommendedConditions;

  /// Additional notes.
  final String notes;

  const TraceProfile({
    required this.record,
    required this.metadata,
    this.references = const [],
    required this.name,
    required this.purpose,
    this.targetSpecies = const [],
    this.recommendedBaits = const [],
    this.hookSizes = const [],
    this.leaderMaterial = '',
    this.leaderStrength = '',
    this.recommendedConditions = const [],
    this.notes = '',
  });

  TraceProfile copyWith({
    KnowledgeRecord? record,
    KnowledgeMetadata? metadata,
    List<KnowledgeReference>? references,
    String? name,
    String? purpose,
    List<String>? targetSpecies,
    List<String>? recommendedBaits,
    List<String>? hookSizes,
    String? leaderMaterial,
    String? leaderStrength,
    List<String>? recommendedConditions,
    String? notes,
  }) {
    return TraceProfile(
      record: record ?? this.record,
      metadata: metadata ?? this.metadata,
      references: references ?? this.references,
      name: name ?? this.name,
      purpose: purpose ?? this.purpose,
      targetSpecies: targetSpecies ?? this.targetSpecies,
      recommendedBaits:
      recommendedBaits ?? this.recommendedBaits,
      hookSizes: hookSizes ?? this.hookSizes,
      leaderMaterial:
      leaderMaterial ?? this.leaderMaterial,
      leaderStrength:
      leaderStrength ?? this.leaderStrength,
      recommendedConditions:
      recommendedConditions ?? this.recommendedConditions,
      notes: notes ?? this.notes,
    );
  }

  @override
  String toString() {
    return 'TraceProfile(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TraceProfile &&
        other.record.id == record.id;
  }

  @override
  int get hashCode => record.id.hashCode;
}