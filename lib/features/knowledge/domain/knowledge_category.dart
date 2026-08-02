// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_category.dart
//
// LEGACY KNOWLEDGE CATEGORY
//
// This enum supports the legacy KnowledgeRecord model during the KNOW-001
// migration.
//
// IMPORTANT
// ---------
// The canonical KnowledgeCategory used by the new Domain-Driven Design (DDD)
// architecture is located at:
//
// lib/features/knowledge/domain/enums/knowledge_category.dart
//
// This legacy enum will be removed once all legacy KnowledgeRecord instances
// have been migrated to the canonical domain model.
// -----------------------------------------------------------------------------

enum KnowledgeCategory {
  // ---------------------------------------------------------------------------
  // Legacy profile sections
  // ---------------------------------------------------------------------------

  identity,
  behaviour,
  habitat,
  season,
  tide,
  moon,
  wind,
  swell,
  waterTemperature,
  current,
  bait,
  lure,
  presentation,
  retrieve,
  tackle,
  knots,
  hooks,
  leader,
  rig,
  location,
  structure,
  regulations,
  conservation,
  safety,
  expertTip,

  // ---------------------------------------------------------------------------
  // Temporary compatibility values
  //
  // These values are required by the existing species knowledge files while the
  // legacy KnowledgeRecord model remains in use.
  //
  // They mirror the canonical KnowledgeCategory enum and will be removed when
  // the migration to the DDD model is complete.
  // ---------------------------------------------------------------------------

  species,
  fishBehaviour,
  fishAnatomy,
}