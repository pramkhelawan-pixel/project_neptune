// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_source.dart
//
// Purpose:
// Canonical domain entity representing the origin of a knowledge record.
//
// Every piece of knowledge within Neptune shall be traceable to one or more
// authoritative sources.
//
// STD-005:
// This entity is part of Neptune's Canonical Domain and shall only be modified
// through an approved architecture decision.
// -----------------------------------------------------------------------------

/// Represents the origin of a knowledge record.
///
/// Examples:
///
/// • Scientific paper
/// • Government publication
/// • FishBase
/// • Expert angler
/// • Neptune research
/// • Field observation
class KnowledgeSource {
  // ---------------------------------------------------------------------------
  // Identity
  // ---------------------------------------------------------------------------

  /// Display name of the source.
  final String name;

  /// Classification of the source.
  ///
  /// Examples:
  ///
  /// • Scientific Database
  /// • Scientific Literature
  /// • Government Publication
  /// • Expert Knowledge
  /// • Neptune Research
  /// • Field Observation
  final String type;

  /// Citation, DOI, publication or internal reference.
  final String reference;

  /// Reliability score assigned by Neptune.
  ///
  /// Expected range:
  ///
  /// 0.00 → 1.00
  final double reliability;

  const KnowledgeSource({
    required this.name,
    required this.type,
    required this.reference,
    required this.reliability,
  });

  KnowledgeSource copyWith({
    String? name,
    String? type,
    String? reference,
    double? reliability,
  }) {
    return KnowledgeSource(
      name: name ?? this.name,
      type: type ?? this.type,
      reference: reference ?? this.reference,
      reliability: reliability ?? this.reliability,
    );
  }

  @override
  String toString() {
    return 'KnowledgeSource('
        'name: $name, '
        'type: $type'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is KnowledgeSource &&
        other.name == name &&
        other.reference == reference &&
        other.type == type;
  }

  @override
  int get hashCode => Object.hash(
    name,
    type,
    reference,
  );
}