import '../domain/knowledge_record.dart';

abstract class KnowledgeRepository {
  List<KnowledgeRecord> all();

  List<KnowledgeRecord> forSpecies(
      String species,
      );

  List<KnowledgeRecord> byCategory(
      String species,
      String category,
      );
}