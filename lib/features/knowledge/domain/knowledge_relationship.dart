// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_relationship.dart
// Purpose:
// Defines typed relationships between Neptune knowledge records.
// These relationships form the foundation of the Neptune Knowledge Graph.
// -----------------------------------------------------------------------------

/// Types of relationships between knowledge records.
enum KnowledgeRelationshipType {
  uses,
  usedBy,
  targets,
  foundAt,
  worksBestIn,
  recommendedWith,
  alternativeTo,
  requires,
  relatedTo,
  avoids,
}

/// Represents a relationship between two knowledge records.
///
/// Example:
///
/// Shad
///     uses
/// Sardine Fillet
///
/// or
///
/// Sardine Fillet
///     recommendedWith
/// Throw Bait Trace
class KnowledgeRelationship {
  /// Source Knowledge ID.
  final String sourceId;

  /// Destination Knowledge ID.
  final String targetId;

  /// Relationship type.
  final KnowledgeRelationshipType type;

  /// Relationship confidence.
  ///
  /// Range:
  /// 0.0 -> 1.0
  final double confidence;

  /// Optional explanation.
  final String? reason;

  const KnowledgeRelationship({
    required this.sourceId,
    required this.targetId,
    required this.type,
    this.confidence = 1.0,
    this.reason,
  });
}