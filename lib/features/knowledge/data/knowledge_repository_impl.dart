import '../domain/knowledge_record.dart';
import '../repositories/knowledge_repository.dart';
import 'species/shad_knowledge.dart';

class KnowledgeRepositoryImpl
    implements KnowledgeRepository {
  @override
  List<KnowledgeRecord> all() {
    return [
      ...shadKnowledge,
    ];
  }

  @override
  List<KnowledgeRecord> forSpecies(
      String species,
      ) {
    return all()
        .where(
          (record) =>
      record.species.toLowerCase() ==
          species.toLowerCase(),
    )
        .toList();
  }

  @override
  List<KnowledgeRecord> byCategory(
      String species,
      String category,
      ) {
    return all()
        .where(
          (record) =>
      record.species.toLowerCase() ==
          species.toLowerCase() &&
          record.category.name.toLowerCase() ==
              category.toLowerCase(),
    )
        .toList();
  }
}