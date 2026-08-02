// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_category.dart
//
// Purpose:
// Defines the canonical taxonomy for every KnowledgeRecord within the Neptune
// Knowledge Repository.
//
// This taxonomy is the single authoritative classification system used by:
//
// • Knowledge Repository
// • Knowledge Search
// • Recommendation Engine
// • AI Intelligence
// • Analytics
//
// STD-005:
// This enum forms part of Neptune's Canonical Domain and shall only be modified
// through an approved Architecture Decision Record (ADR).
// -----------------------------------------------------------------------------

/// Defines the primary category for every knowledge record in Neptune.
///
/// Every knowledge record belongs to exactly one category.
///
/// Categories are organised by business meaning rather than implementation.
/// This taxonomy is designed to scale as Neptune grows without requiring
/// structural changes.
enum KnowledgeCategory {
  // ---------------------------------------------------------------------------
  // Species Knowledge
  // ---------------------------------------------------------------------------

  /// General species overview and identification.
  identity,

  /// Scientific classification and taxonomy.
  taxonomy,

  /// Biology and physiology.
  biology,

  /// Physical structure and anatomy.
  anatomy,

  /// Behaviour and movement patterns.
  behaviour,

  /// Feeding habits and prey preferences.
  feeding,

  /// Habitat and preferred environments.
  habitat,

  /// Life cycle and reproduction.
  lifeCycle,

  /// Seasonal behaviour and migration.
  seasonality,

  /// Geographic distribution.
  distribution,

  // ---------------------------------------------------------------------------
  // Fishing Knowledge
  // ---------------------------------------------------------------------------

  bait,

  lure,

  hook,

  sinker,

  swivel,

  line,

  leader,

  trace,

  rig,

  knot,

  presentation,

  retrieve,

  casting,

  technique,

  // ---------------------------------------------------------------------------
  // Environmental Knowledge
  // ---------------------------------------------------------------------------

  weather,

  wind,

  tide,

  moon,

  swell,

  current,

  waterTemperature,

  marine,

  // ---------------------------------------------------------------------------
  // Locations
  // ---------------------------------------------------------------------------

  beach,

  estuary,

  reef,

  riverMouth,

  structure,

  // ---------------------------------------------------------------------------
  // Equipment
  // ---------------------------------------------------------------------------

  equipment,

  electronics,

  maintenance,

  // ---------------------------------------------------------------------------
  // Safety
  // ---------------------------------------------------------------------------

  safety,

  firstAid,

  navigation,

  // ---------------------------------------------------------------------------
  // Conservation
  // ---------------------------------------------------------------------------

  conservation,

  regulations,

  fishCare,

  // ---------------------------------------------------------------------------
  // Lifestyle
  // ---------------------------------------------------------------------------

  travel,

  camping,

  cooking,

  competition,

  // ---------------------------------------------------------------------------
  // Reference
  // ---------------------------------------------------------------------------

  glossary,
}