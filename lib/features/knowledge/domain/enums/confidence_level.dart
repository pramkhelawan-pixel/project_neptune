/// Represents Neptune's confidence in a knowledge record.
///
/// Confidence is independent of the evidence source.
/// For example, a rule may originate from expert knowledge,
/// but after years of validation through catch data,
/// its confidence may become very high.
enum ConfidenceLevel {
  veryLow,
  low,
  moderate,
  high,
  veryHigh,
}