import '../domain/knowledge_record.dart';

abstract class KnowledgeRepository {
  const KnowledgeRepository();

  /// Returns every knowledge record.
  List<KnowledgeRecord> all();

  /// Returns every record for a species.
  List<KnowledgeRecord> forSpecies(
      String species,
      );

  /// Returns every record within a category.
  List<KnowledgeRecord> byCategory(
      String species,
      String category,
      );
}