import '../domain/knowledge_category.dart';
import '../domain/knowledge_record.dart';
import '../repositories/knowledge_repository.dart';

class KnowledgeService {
  final KnowledgeRepository repository;

  const KnowledgeService({
    required this.repository,
  });

  List<KnowledgeRecord> allKnowledge() {
    return repository.all();
  }

  List<KnowledgeRecord> knowledgeForSpecies(
      String species,
      ) {
    return repository.forSpecies(
      species,
    );
  }

  List<KnowledgeRecord> knowledgeByCategory({
    required String species,
    required KnowledgeCategory category,
  }) {
    return repository.byCategory(
      species,
      category.name,
    );
  }

  List<KnowledgeRecord> baitKnowledge(
      String species,
      ) {
    return knowledgeByCategory(
      species: species,
      category: KnowledgeCategory.bait,
    );
  }

  List<KnowledgeRecord> lureKnowledge(
      String species,
      ) {
    return knowledgeByCategory(
      species: species,
      category: KnowledgeCategory.lure,
    );
  }

  List<KnowledgeRecord> presentationKnowledge(
      String species,
      ) {
    return knowledgeByCategory(
      species: species,
      category: KnowledgeCategory.presentation,
    );
  }

  List<KnowledgeRecord> behaviourKnowledge(
      String species,
      ) {
    return knowledgeByCategory(
      species: species,
      category: KnowledgeCategory.behaviour,
    );
  }

  List<KnowledgeRecord> habitatKnowledge(
      String species,
      ) {
    return knowledgeByCategory(
      species: species,
      category: KnowledgeCategory.habitat,
    );
  }
}