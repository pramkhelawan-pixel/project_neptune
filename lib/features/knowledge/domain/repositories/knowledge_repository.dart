// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_repository.dart
// Purpose:
// Defines the contract for accessing structured knowledge throughout Neptune.
//
// The repository abstracts the underlying data source. During the MVP,
// knowledge may come from Dart constants. Later it may come from JSON,
// SQLite, Supabase or offline knowledge packs without changing the domain.
// -----------------------------------------------------------------------------

import '../entities/knowledge_record.dart';
import '../enums/knowledge_category.dart';

abstract class KnowledgeRepository {
  /// Returns every knowledge record.
  Future<List<KnowledgeRecord>> getAll();

  /// Returns every record in a specific category.
  Future<List<KnowledgeRecord>> getByCategory(
      KnowledgeCategory category,
      );

  /// Finds a knowledge record by its unique ID.
  Future<KnowledgeRecord?> getById(
      String id,
      );

  /// Performs a simple text search across knowledge.
  Future<List<KnowledgeRecord>> search(
      String query,
      );
}