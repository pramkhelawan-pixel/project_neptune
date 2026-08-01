import '../domain/entities/species_knowledge.dart';
import '../domain/repositories/species_knowledge_repository.dart';

/// Temporary implementation.
///
/// This will later load Neptune's knowledge from a database.
class SpeciesKnowledgeRepositoryImpl
    implements SpeciesKnowledgeRepository {
  const SpeciesKnowledgeRepositoryImpl({
    required this.knowledge,
  });

  final List<SpeciesKnowledge> knowledge;

  @override
  List<SpeciesKnowledge> getAll() {
    return knowledge;
  }

  @override
  SpeciesKnowledge? findById(
      String id,
      ) {
    for (final item in knowledge) {
      if (item.species.id == id) {
        return item;
      }
    }

    return null;
  }
}