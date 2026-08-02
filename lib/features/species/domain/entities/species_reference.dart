import 'knowledge_confidence.dart';
import 'knowledge_source.dart';

/// Records the provenance of Neptune's fishing knowledge.
class SpeciesReference {
  /// Short reference title.
  final String title;

  /// Origin of the knowledge.
  final KnowledgeSource source;

  /// Confidence assigned to this reference.
  final KnowledgeConfidence confidence;

  const SpeciesReference({
    required this.title,
    required this.source,
    required this.confidence,
  });
}