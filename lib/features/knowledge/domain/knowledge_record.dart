import 'evidence_level.dart';
import 'knowledge_category.dart';
import 'knowledge_source.dart';

class KnowledgeRecord {
  final String id;

  final String species;

  final KnowledgeCategory category;

  final String title;

  final String description;

  final EvidenceLevel evidenceLevel;

  final double confidence;

  final List<KnowledgeSource> sources;

  final List<String> regions;

  final List<String> seasons;

  final List<String> tags;

  final DateTime lastUpdated;

  const KnowledgeRecord({
    required this.id,
    required this.species,
    required this.category,
    required this.title,
    required this.description,
    required this.evidenceLevel,
    required this.confidence,
    required this.sources,
    required this.regions,
    required this.seasons,
    required this.tags,
    required this.lastUpdated,
  });
}