// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: water_conditions.dart
//
// Purpose:
// Immutable value object representing observed water conditions.
//
// WaterConditions forms part of Neptune's canonical Marine Domain and is
// consumed by the Intelligence Engine when evaluating fishing conditions.
//
// -----------------------------------------------------------------------------

import '../enums/water_colour.dart';

class WaterConditions {
  /// Water temperature in degrees Celsius.
  final double temperature;

  /// Water clarity in metres.
  final double clarity;

  /// Observed water colour.
  final WaterColour colour;

  /// Salinity in Practical Salinity Units (PSU).
  final double salinity;

  const WaterConditions({
    required this.temperature,
    required this.clarity,
    required this.colour,
    required this.salinity,
  });

  /// Returns true when the water is considered warm.
  bool get isWarm => temperature >= 20.0;

  /// Returns true when visibility is good.
  bool get isClear => clarity >= 2.0;

  /// Returns true when salinity is within the normal seawater range.
  bool get isNormalSalinity =>
      salinity >= 34.0 && salinity <= 36.0;

  /// Returns true when the water is generally fishable.
  bool get isFishable => colour.isFishable;

  /// Returns true when the water is considered dirty.
  bool get isDirty => colour.isDirty;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WaterConditions &&
        other.temperature == temperature &&
        other.clarity == clarity &&
        other.colour == colour &&
        other.salinity == salinity;
  }

  @override
  int get hashCode => Object.hash(
    temperature,
    clarity,
    colour,
    salinity,
  );

  @override
  String toString() {
    return 'WaterConditions('
        'temperature: ${temperature.toStringAsFixed(1)} °C, '
        'clarity: ${clarity.toStringAsFixed(1)} m, '
        'colour: ${colour.displayName}, '
        'salinity: ${salinity.toStringAsFixed(1)} PSU'
        ')';
  }
}