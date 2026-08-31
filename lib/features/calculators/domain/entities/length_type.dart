/// The kind of body-length measurement a length-weight equation was fitted
/// against.
///
/// Mixing these up would silently invalidate an estimate -- a coefficient
/// fitted to Standard Length applied to a Total Length measurement (or
/// vice versa) produces a wrong number that still looks plausible. Every
/// [LengthWeightCoefficients] record carries its own [LengthType] so the
/// calculator and UI never assume one.
enum LengthType {
  standardLength,
  totalLength,
  forkLength;

  /// Short scientific abbreviation, e.g. for compact disclaimers.
  String get abbreviation {
    switch (this) {
      case LengthType.standardLength:
        return 'SL';
      case LengthType.totalLength:
        return 'TL';
      case LengthType.forkLength:
        return 'FL';
    }
  }

  /// Full display label, e.g. "Standard Length (SL)".
  String get label {
    switch (this) {
      case LengthType.standardLength:
        return 'Standard Length (SL)';
      case LengthType.totalLength:
        return 'Total Length (TL)';
      case LengthType.forkLength:
        return 'Fork Length (FL)';
    }
  }
}
