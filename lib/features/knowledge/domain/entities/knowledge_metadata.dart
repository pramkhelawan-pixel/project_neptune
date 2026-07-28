// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_metadata.dart
// Purpose:
// Stores lifecycle and governance information for a Knowledge Record.
//
// Metadata is intentionally separated from the KnowledgeRecord entity to keep
// the core model lightweight while allowing Neptune to evolve into a large,
// enterprise-grade knowledge platform.
// -----------------------------------------------------------------------------

/// Metadata associated with a knowledge record.
class KnowledgeMetadata {
  /// Author of the record.
  final String author;

  /// Version number.
  final String version;

  /// Date the record was created.
  final DateTime createdAt;

  /// Date the record was last updated.
  final DateTime updatedAt;

  /// Date the record was last reviewed.
  final DateTime? lastReviewedAt;

  /// Whether the record has been verified.
  final bool verified;

  /// Whether the record is available only to Premium users.
  final bool premium;

  /// Indicates whether the record is active.
  final bool active;

  const KnowledgeMetadata({
    required this.author,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
    this.lastReviewedAt,
    this.verified = false,
    this.premium = false,
    this.active = true,
  });

  KnowledgeMetadata copyWith({
    String? author,
    String? version,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastReviewedAt,
    bool? verified,
    bool? premium,
    bool? active,
  }) {
    return KnowledgeMetadata(
      author: author ?? this.author,
      version: version ?? this.version,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      verified: verified ?? this.verified,
      premium: premium ?? this.premium,
      active: active ?? this.active,
    );
  }

  @override
  String toString() {
    return 'KnowledgeMetadata(version: $version, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KnowledgeMetadata &&
        other.author == author &&
        other.version == version &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => Object.hash(author, version, createdAt);
}