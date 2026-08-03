// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// Value Object
// -----------------------------------------------------------------------------

class IntelligenceScore {
  /// Final weighted score.
  final int value;

  const IntelligenceScore(this.value);

  bool get excellent => value >= 90;

  bool get veryGood => value >= 80;

  bool get good => value >= 70;

  bool get fair => value >= 50;

  bool get poor => value < 50;
}