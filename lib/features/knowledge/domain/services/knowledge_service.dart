// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_service.dart
// Purpose:
// Provides business operations for working with the Neptune Knowledge
// Repository.
//
// This service sits between the presentation layer and the repository,
// allowing business rules to evolve independently of the data source.
// -----------------------------------------------------------------------------

import '../entities/knowledge_record.dart';
import '../enums/knowledge_category.dart';
import '../repositories/knowledge_repository.dart';

class KnowledgeService {
  final KnowledgeRepository repository;

  const KnowledgeService({
    required this.repository,
  });

  /// Returns all knowledge records.
  Future<List<KnowledgeRecord>> getAllKnowledge() {
    return repository.getAll();
  }

  /// Returns all knowledge records for a category.
  Future<List<KnowledgeRecord>> getKnowledgeByCategory(
      KnowledgeCategory category,
      ) {
    return repository.getByCategory(category);
  }

  /// Returns a knowledge record by its unique ID.
  Future<KnowledgeRecord?> getKnowledgeById(
      String id,
      ) {
    return repository.getById(id);
  }

  /// Performs a text search across the knowledge repository.
  Future<List<KnowledgeRecord>> searchKnowledge(
      String query,
      ) {
    return repository.search(query);
  }
}