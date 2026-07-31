/// Classification of a completed fishing session.
///
/// This describes whether the objectives of the trip were achieved.
enum SessionOutcomeType {
  /// The fishing objectives were fully achieved.
  successful,

  /// Some objectives were achieved.
  partiallySuccessful,

  /// The objectives were not achieved.
  unsuccessful,
}