// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: atmospheric_conditions.dart
//
// Purpose:
// Immutable value object representing observed atmospheric conditions.
//
// AtmosphericConditions forms part of Neptune's canonical Marine Domain and is
// consumed by the Intelligence Engine when evaluating fishing conditions.
//
// -----------------------------------------------------------------------------

import '../enums/cloud_cover.dart';

class AtmosphericConditions {
  /// Atmospheric pressure in hectopascals (hPa).
  final double pressure;

  /// Relative humidity as a percentage.
  final double humidity;

  /// Air temperature in degrees Celsius.
  final double airTemperature;

  /// Visibility in kilometres.
  final double visibility;

  /// Cloud cover classification.
  final CloudCover cloudCover;

  /// Precipitation amount in millimetres.
  final double precipitation;

  /// Forecast probability of precipitation as a percentage.
  final double precipitationProbability;

  const AtmosphericConditions({
    required this.pressure,
    required this.humidity,
    required this.airTemperature,
    required this.visibility,
    required this.cloudCover,
    required this.precipitation,
    required this.precipitationProbability,
  });

  /// Returns true when atmospheric pressure is considered high.
  bool get isHighPressure => pressure >= 1015.0;

  /// Returns true when atmospheric pressure is considered low.
  bool get isLowPressure => pressure < 1005.0;

  /// Returns true when visibility is good.
  bool get hasGoodVisibility => visibility >= 10.0;

  /// Returns true when skies are generally clear.
  bool get hasClearSkies => cloudCover.isClear;

  /// Returns true when skies are overcast.
  bool get isOvercast => cloudCover.isOvercast;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AtmosphericConditions &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.airTemperature == airTemperature &&
        other.visibility == visibility &&
        other.cloudCover == cloudCover &&
        other.precipitation == precipitation &&
        other.precipitationProbability == precipitationProbability;
  }

  @override
  int get hashCode => Object.hash(
    pressure,
    humidity,
    airTemperature,
    visibility,
    cloudCover,
    precipitation,
    precipitationProbability,
  );

  @override
  String toString() {
    return 'AtmosphericConditions('
        'pressure: ${pressure.toStringAsFixed(1)} hPa, '
        'humidity: ${humidity.toStringAsFixed(0)}%, '
        'airTemperature: ${airTemperature.toStringAsFixed(1)} °C, '
        'visibility: ${visibility.toStringAsFixed(1)} km, '
        'cloudCover: ${cloudCover.displayName}, '
        'precipitation: ${precipitation.toStringAsFixed(1)} mm, '
        'precipitationProbability: ${precipitationProbability.toStringAsFixed(0)}%'
        ')';
  }
}