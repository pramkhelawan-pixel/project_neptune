// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_reference.dart
// Purpose:
// Represents a reference supporting a Knowledge Record.
//
// References provide traceability for Neptune's recommendations by recording
// where the knowledge originated.
// -----------------------------------------------------------------------------

import '../enums/evidence_level.dart';

/// Represents a supporting reference for a knowledge record.
class KnowledgeReference {
  /// Reference title.
  final String title;

  /// Author or organisation.
  final String author;

  /// Publication or source.
  final String source;

  /// Optional publication year.
  final int? year;

  /// Evidence classification.
  final EvidenceLevel evidenceLevel;

  /// Optional external URL.
  final String? url;

  /// Optional notes.
  final String? notes;

  const KnowledgeReference({
    required this.title,
    required this.author,
    required this.source,
    required this.evidenceLevel,
    this.year,
    this.url,
    this.notes,
  });

  KnowledgeReference copyWith({
    String? title,
    String? author,
    String? source,
    int? year,
    EvidenceLevel? evidenceLevel,
    String? url,
    String? notes,
  }) {
    return KnowledgeReference(
      title: title ?? this.title,
      author: author ?? this.author,
      source: source ?? this.source,
      year: year ?? this.year,
      evidenceLevel: evidenceLevel ?? this.evidenceLevel,
      url: url ?? this.url,
      notes: notes ?? this.notes,
    );
  }

  @override
  String toString() {
    return 'KnowledgeReference(title: $title, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KnowledgeReference &&
        other.title == title &&
        other.source == source;
  }

  @override
  int get hashCode => Object.hash(title, source);
}