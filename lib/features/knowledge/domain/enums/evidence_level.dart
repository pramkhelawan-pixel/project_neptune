/// Indicates the strength of evidence supporting a knowledge record.
///
/// Neptune distinguishes between different sources of knowledge.
/// This allows the platform to explain *why* it makes recommendations
/// and to improve confidence over time.
///
/// During the KNOW-001 migration, legacy values are retained for backward
/// compatibility. They will be removed once all knowledge datasets have been
/// migrated to the canonical model.
enum EvidenceLevel {
  // ---------------------------------------------------------------------------
  // Canonical evidence levels
  // ---------------------------------------------------------------------------

  /// Verified scientific research.
  scientific,

  /// South African fisheries authority or regulatory guidance.
  regulatory,

  /// Published literature or recognised reference works.
  literature,

  /// Validated field observations from recognised experts.
  expert,

  /// Community knowledge that has been validated.
  community,

  /// AI-generated insight that has been validated.
  aiValidated,

  /// Internal Neptune rule derived from multiple trusted sources.
  neptune,

  /// User observation awaiting validation.
  observation,

  // ---------------------------------------------------------------------------
  // Legacy compatibility (temporary)
  // ---------------------------------------------------------------------------

  /// Legacy alias for expert.
  experiencedAngler,

  /// Legacy alias for regulatory.
  regulation,
}