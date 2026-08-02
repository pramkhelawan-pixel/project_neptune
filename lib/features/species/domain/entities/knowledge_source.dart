/// Indicates how a piece of fishing knowledge was obtained.
enum KnowledgeSource {
  /// Peer-reviewed or government fisheries publications.
  scientific,

  /// Published South African angling literature.
  literature,

  /// Verified expert angler knowledge.
  expert,

  /// Neptune's own analysed catch database.
  neptune,

  /// Placeholder values awaiting validation.
  provisional,
}