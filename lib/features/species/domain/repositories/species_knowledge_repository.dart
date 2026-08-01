import '../entities/species_knowledge.dart';

/// Repository containing Neptune's complete fishing knowledge.
abstract class SpeciesKnowledgeRepository {
  const SpeciesKnowledgeRepository();

  /// Returns every species known to Neptune.
  List<SpeciesKnowledge> getAll();

  /// Finds a species by its identifier.
  SpeciesKnowledge? findById(
      String id,
      );
}