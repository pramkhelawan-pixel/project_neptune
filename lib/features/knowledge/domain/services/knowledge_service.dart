// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_repository.dart
// Purpose:
// Defines the authoritative contract for accessing structured knowledge
// throughout Neptune.
//
// This repository is the single entry point for all knowledge retrieval.
//
// Consumers include:
//
// • Recommendation Engine
// • Knowledge Search
// • Species Profiles
// • AI Intelligence
// • Premium Content
// • Future Analytics
// -----------------------------------------------------------------------------

import '../entities/knowledge_record.dart';
import '../enums/evidence_level.dart';
import '../enums/knowledge_category.dart';

/// Contract for accessing Neptune's Knowledge Repository.
///
/// The repository exposes domain-level queries only and is independent of the
/// underlying data source (memory, JSON, SQLite, Supabase or API).
abstract class KnowledgeRepository {
  // ---------------------------------------------------------------------------
  // General Queries
  // ---------------------------------------------------------------------------

  /// Returns every knowledge record.
  Future<List<KnowledgeRecord>> getAll();

  /// Finds a knowledge record by its unique identifier.
  Future<KnowledgeRecord?> getById(String id);

  /// Performs a free-text search across the knowledge repository.
  Future<List<KnowledgeRecord>> search(String query);

  // ---------------------------------------------------------------------------
  // Species Queries
  // ---------------------------------------------------------------------------

  /// Returns all knowledge records associated with a species.
  Future<List<KnowledgeRecord>> getBySpecies(String species);

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

  // ---------------------------------------------------------------------------
  // Category Queries
  // ---------------------------------------------------------------------------

  /// Returns all knowledge records within a category.
  Future<List<KnowledgeRecord>> getByCategory(
      KnowledgeCategory category,
      );

  /// Returns all knowledge records with a specific evidence level.
  Future<List<KnowledgeRecord>> getByEvidenceLevel(
      EvidenceLevel evidenceLevel,
      );

  // ---------------------------------------------------------------------------
  // Metadata Queries
  // ---------------------------------------------------------------------------

  /// Returns all knowledge records containing one or more tags.
  Future<List<KnowledgeRecord>> getByTags(
      List<String> tags,
      );

  /// Returns all knowledge records applicable to a region.
  Future<List<KnowledgeRecord>> getByRegion(
      String region,
      );

  // ---------------------------------------------------------------------------
  // Knowledge Intelligence
  // ---------------------------------------------------------------------------

  /// Returns knowledge related to an existing knowledge record.
  ///
  /// Implementations may use tags, species, category or semantic similarity
  /// to determine relationships.
  Future<List<KnowledgeRecord>> getRelatedKnowledge(
      String knowledgeId,
      );
}