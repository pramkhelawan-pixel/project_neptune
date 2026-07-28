// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_repository_impl.dart
// Purpose:
// Default implementation of the Neptune Knowledge Repository.
//
// During the MVP this repository returns an empty collection. Future sprints
// will progressively populate it with structured South African angling
// knowledge.
// -----------------------------------------------------------------------------

import '../../domain/entities/knowledge_record.dart';
import '../../domain/enums/knowledge_category.dart';
import '../../domain/repositories/knowledge_repository.dart';

class KnowledgeRepositoryImpl implements KnowledgeRepository {
  const KnowledgeRepositoryImpl();

  @override
  Future<List<KnowledgeRecord>> getAll() async {
    return const [];
  }

  @override
  Future<List<KnowledgeRecord>> getByCategory(
      KnowledgeCategory category,
      ) async {
    return const [];
  }

  @override
  Future<KnowledgeRecord?> getById(
      String id,
      ) async {
    return null;
  }

  @override
  Future<List<KnowledgeRecord>> search(
      String query,
      ) async {
    return const [];
  }
}