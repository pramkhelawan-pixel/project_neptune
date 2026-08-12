// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: marine_conditions.dart
//
// Purpose:
// Represents the complete set of environmental and marine conditions used by
// Neptune's intelligence engine.
//
// This model is designed to evolve as Neptune's prediction engine grows.
// -----------------------------------------------------------------------------

import '../enums/tide_state.dart';

class MarineConditions {
  /// Wind speed (km/h).
  final double windSpeed;

  /// Wind direction (e.g. N, NE, SW).
  final String windDirection;

  /// Swell height (m).
  final double swellHeight;

  /// Swell period (seconds).
  final double swellPeriod;

  /// Sea surface temperature (°C).
  final double waterTemperature;

  /// Air temperature (°C).
  final double airTemperature;

  /// Atmospheric pressure (hPa).
  final double atmosphericPressure;

  /// Precipitation amount (mm).
  ///
  /// Null for construction paths that predate this field (mocks, legacy
  /// mappers) — callers must treat null as "unknown".
  final double? precipitation;

  /// Forecast probability of precipitation (%).
  ///
  /// Null for construction paths that predate this field (mocks, legacy
  /// mappers) — callers must treat null as "unknown".
  final double? precipitationProbability;

  /// Tide height (m).
  final double tideHeight;

  /// Tide state.
  final String tideState;

  /// Canonical tide state enum, populated by
  /// [MarineConditionsLegacyMapper] from the canonical Marine domain.
  ///
  /// Null for construction paths that predate the canonical migration
  /// (mocks, legacy mappers) — callers must treat null as "unknown".
  final TideState? canonicalTideState;

  /// Next predicted high tide.
  final DateTime? nextHighTide;

  /// Next predicted low tide.
  final DateTime? nextLowTide;

  /// Moon phase.
  final String moonPhase;

  /// Sunrise.
  final DateTime sunrise;

  /// Sunset.
  final DateTime sunset;

  const MarineConditions({
    required this.windSpeed,
    required this.windDirection,
    required this.swellHeight,
    required this.swellPeriod,
    required this.waterTemperature,
    required this.airTemperature,
    required this.atmosphericPressure,
    this.precipitation,
    this.precipitationProbability,
    required this.tideHeight,
    required this.tideState,
    this.canonicalTideState,
    required this.nextHighTide,
    required this.nextLowTide,
    required this.moonPhase,
    required this.sunrise,
    required this.sunset,
  });

  MarineConditions copyWith({
    double? windSpeed,
    String? windDirection,
    double? swellHeight,
    double? swellPeriod,
    double? waterTemperature,
    double? airTemperature,
    double? atmosphericPressure,
    double? precipitation,
    double? precipitationProbability,
    double? tideHeight,
    String? tideState,
    TideState? canonicalTideState,
    DateTime? nextHighTide,
    DateTime? nextLowTide,
    String? moonPhase,
    DateTime? sunrise,
    DateTime? sunset,
  }) {
    return MarineConditions(
      windSpeed: windSpeed ?? this.windSpeed,
      windDirection: windDirection ?? this.windDirection,
      swellHeight: swellHeight ?? this.swellHeight,
      swellPeriod: swellPeriod ?? this.swellPeriod,
      waterTemperature: waterTemperature ?? this.waterTemperature,
      airTemperature: airTemperature ?? this.airTemperature,
      atmosphericPressure:
      atmosphericPressure ?? this.atmosphericPressure,
      precipitation: precipitation ?? this.precipitation,
      precipitationProbability:
      precipitationProbability ?? this.precipitationProbability,
      tideHeight: tideHeight ?? this.tideHeight,
      tideState: tideState ?? this.tideState,
      canonicalTideState: canonicalTideState ?? this.canonicalTideState,
      nextHighTide: nextHighTide ?? this.nextHighTide,
      nextLowTide: nextLowTide ?? this.nextLowTide,
      moonPhase: moonPhase ?? this.moonPhase,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }
}