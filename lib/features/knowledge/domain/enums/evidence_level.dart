/// Indicates the strength of evidence supporting a knowledge record.
///
/// Neptune distinguishes between different sources of knowledge.
/// This allows the platform to explain *why* it makes recommendations
/// and to improve confidence over time.
enum EvidenceLevel {
  /// Verified scientific research.
  scientific,

  /// South African fisheries authority or regulatory guidance.
  regulatory,

  /// Published literature or recognised reference works.
  literature,

  /// Validated field observations from experienced anglers.
  expert,

  /// Community knowledge that has been validated.
  community,

  /// AI-generated insight that has been validated.
  aiValidated,

  /// Internal Neptune rule derived from multiple trusted sources.
  neptune,

  /// User observation awaiting validation.
  observation,
}