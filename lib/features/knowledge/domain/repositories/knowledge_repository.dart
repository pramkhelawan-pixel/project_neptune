// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_repository.dart
// Purpose:
// Defines the authoritative contract for accessing structured knowledge
// throughout Neptune.
//
// This repository supports both the Recommendation Engine and future
// knowledge search capabilities.
// -----------------------------------------------------------------------------

import '../entities/knowledge_record.dart';
import '../enums/knowledge_category.dart';

abstract class KnowledgeRepository {
  /// Returns every knowledge record.
  Future<List<KnowledgeRecord>> getAll();

  /// Returns all knowledge records for a species.
  Future<List<KnowledgeRecord>> getBySpecies(
      String species,
      );

  /// Returns all knowledge records in a category.
  Future<List<KnowledgeRecord>> getByCategory(
      KnowledgeCategory category,
      );

  /// Returns all knowledge records for a species within a category.
  Future<List<KnowledgeRecord>> getBySpeciesAndCategory({
    required String species,
    required KnowledgeCategory category,
  });

  /// Returns the highest confidence knowledge record for a species
  /// within a category.
  Future<KnowledgeRecord?> getBestKnowledge({
    required String species,
    required KnowledgeCategory category,
  });

  /// Finds a knowledge record by its unique ID.
  Future<KnowledgeRecord?> getById(
      String id,
      );

  /// Performs a text search across the knowledge repository.
  Future<List<KnowledgeRecord>> search(
      String query,
      );
}