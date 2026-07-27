import '../domain/knowledge_record.dart';
import '../repositories/knowledge_repository.dart';

class KnowledgeService {
  final KnowledgeRepository repository;

  const KnowledgeService({
    required this.repository,
  });

  List<KnowledgeRecord> shadBaits() {
    return repository.byCategory(
      'Shad',
      'bait',
    );
  }

  List<KnowledgeRecord> shadKnowledge() {
    return repository.forSpecies(
      'Shad',
    );
  }
}