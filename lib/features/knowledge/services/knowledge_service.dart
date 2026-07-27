import '../domain/knowledge_category.dart';
import '../domain/knowledge_record.dart';
import '../repositories/knowledge_repository.dart';

class KnowledgeService {
  final KnowledgeRepository repository;

  const KnowledgeService({
    required this.repository,
  });

  List<KnowledgeRecord> forSpecies(
      String species,
      ) {
    return repository.forSpecies(species);
  }

  List<KnowledgeRecord> byCategory({
    required String species,
    required KnowledgeCategory category,
  }) {
    return repository.byCategory(
      species,
      category.name,
    );
  }

  KnowledgeRecord? bestKnowledge({
    required String species,
    required KnowledgeCategory category,
  }) {
    final records = repository.byCategory(
      species,
      category.name,
    );

    if (records.isEmpty) {
      return null;
    }

    records.sort(
          (a, b) => b.confidence.compareTo(a.confidence),
    );

    return records.first;
  }
}