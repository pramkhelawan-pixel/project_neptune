import '../domain/entities/knowledge_record.dart';
import '../domain/enums/knowledge_category.dart';
import '../domain/repositories/knowledge_repository.dart';

class KnowledgeService {
  final KnowledgeRepository repository;

  const KnowledgeService({
    required this.repository,
  });

  Future<List<KnowledgeRecord>> forSpecies(
      String species,
      ) {
    return repository.getBySpecies(species);
  }

  Future<List<KnowledgeRecord>> byCategory({
    required String species,
    required KnowledgeCategory category,
  }) {
    return repository.getBySpeciesAndCategory(
      species: species,
      category: category,
    );
  }

  Future<KnowledgeRecord?> bestKnowledge({
    required String species,
    required KnowledgeCategory category,
  }) {
    return repository.getBestKnowledge(
      species: species,
      category: category,
    );
  }
}