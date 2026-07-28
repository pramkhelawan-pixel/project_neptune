// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: bait_profile.dart
// Purpose:
// Defines a structured bait profile used throughout the Neptune Knowledge
// Repository.
// -----------------------------------------------------------------------------

import 'knowledge_metadata.dart';
import 'knowledge_record.dart';
import 'knowledge_reference.dart';

/// Represents a complete bait profile.
class BaitProfile {
  /// Core knowledge record.
  final KnowledgeRecord record;

  /// Lifecycle metadata.
  final KnowledgeMetadata metadata;

  /// Supporting references.
  final List<KnowledgeReference> references;

  /// Display name.
  final String name;

  /// Alternative names.
  final List<String> alternativeNames;

  /// Target species.
  final List<String> targetSpecies;

  /// Preparation methods.
  final List<String> preparationMethods;

  /// Presentation techniques.
  final List<String> presentationTechniques;

  /// Storage recommendations.
  final String storage;

  /// Typical availability.
  final String availability;

  /// Additional notes.
  final String notes;

  const BaitProfile({
    required this.record,
    required this.metadata,
    this.references = const [],
    required this.name,
    this.alternativeNames = const [],
    this.targetSpecies = const [],
    this.preparationMethods = const [],
    this.presentationTechniques = const [],
    this.storage = '',
    this.availability = '',
    this.notes = '',
  });

  BaitProfile copyWith({
    KnowledgeRecord? record,
    KnowledgeMetadata? metadata,
    List<KnowledgeReference>? references,
    String? name,
    List<String>? alternativeNames,
    List<String>? targetSpecies,
    List<String>? preparationMethods,
    List<String>? presentationTechniques,
    String? storage,
    String? availability,
    String? notes,
  }) {
    return BaitProfile(
      record: record ?? this.record,
      metadata: metadata ?? this.metadata,
      references: references ?? this.references,
      name: name ?? this.name,
      alternativeNames: alternativeNames ?? this.alternativeNames,
      targetSpecies: targetSpecies ?? this.targetSpecies,
      preparationMethods:
      preparationMethods ?? this.preparationMethods,
      presentationTechniques:
      presentationTechniques ?? this.presentationTechniques,
      storage: storage ?? this.storage,
      availability: availability ?? this.availability,
      notes: notes ?? this.notes,
    );
  }

  @override
  String toString() {
    return 'BaitProfile(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaitProfile &&
        other.record.id == record.id;
  }

  @override
  int get hashCode => record.id.hashCode;
}