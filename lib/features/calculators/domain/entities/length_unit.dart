/// A user-entered length unit for the Length-to-Weight calculator.
///
/// Every [LengthWeightCoefficients] equation is fitted and applied in
/// centimetres -- this is the only place unit conversion happens, and it
/// happens before the equation ever sees the value.
enum LengthUnit {
  centimetres,
  inches;

  double toCentimetres(double value) {
    switch (this) {
      case LengthUnit.centimetres:
        return value;
      case LengthUnit.inches:
        return value * 2.54;
    }
  }
}
