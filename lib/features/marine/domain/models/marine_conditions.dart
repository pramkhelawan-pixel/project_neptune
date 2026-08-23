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

import '../../../lunar/domain/solunar_period.dart';

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

  /// Swell direction (e.g. N, NE, SW).
  ///
  /// Null for construction paths that predate this field (mocks, legacy
  /// mappers) — callers must treat null as "unknown".
  final String? swellDirection;

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

  /// Locally-calculated moonrise for the observation date/location.
  ///
  /// Null when the Moon does not rise within that calendar day — a real,
  /// non-error astronomical outcome (see [SolunarPeriod]) — callers must
  /// treat null as "no moonrise today", not "unknown".
  final DateTime? moonrise;

  /// Locally-calculated moonset for the observation date/location.
  ///
  /// Null when the Moon does not set within that calendar day — a real,
  /// non-error astronomical outcome — callers must treat null as "no
  /// moonset today", not "unknown".
  final DateTime? moonset;

  /// Solunar major feeding periods (moon transit and antitransit ± 1h).
  /// Always two entries when populated by [MarineConditionsLegacyMapper];
  /// empty for construction paths that predate this field.
  final List<SolunarPeriod> majorPeriods;

  /// Solunar minor feeding periods (moonrise and moonset ± 1h). Zero, one,
  /// or two entries depending on which events occur that day.
  final List<SolunarPeriod> minorPeriods;

  /// When these conditions were actually observed.
  ///
  /// Set on every real fetch (fresh or last-known-good fallback — see
  /// MarineRepositoryImpl). Null only for construction paths that predate
  /// this field (mocks, legacy fixtures) — callers must treat null as
  /// "unknown", not "fresh".
  final DateTime? observedAt;

  const MarineConditions({
    required this.windSpeed,
    required this.windDirection,
    required this.swellHeight,
    required this.swellPeriod,
    this.swellDirection,
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
    this.moonrise,
    this.moonset,
    this.majorPeriods = const [],
    this.minorPeriods = const [],
    this.observedAt,
  });

  MarineConditions copyWith({
    double? windSpeed,
    String? windDirection,
    double? swellHeight,
    double? swellPeriod,
    String? swellDirection,
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
    DateTime? moonrise,
    DateTime? moonset,
    List<SolunarPeriod>? majorPeriods,
    List<SolunarPeriod>? minorPeriods,
    DateTime? observedAt,
  }) {
    return MarineConditions(
      windSpeed: windSpeed ?? this.windSpeed,
      windDirection: windDirection ?? this.windDirection,
      swellHeight: swellHeight ?? this.swellHeight,
      swellPeriod: swellPeriod ?? this.swellPeriod,
      swellDirection: swellDirection ?? this.swellDirection,
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
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      majorPeriods: majorPeriods ?? this.majorPeriods,
      minorPeriods: minorPeriods ?? this.minorPeriods,
      observedAt: observedAt ?? this.observedAt,
    );
  }

  /// True when [observedAt] is missing or older than the 6-hour threshold
  /// used by [ObservationMetadata.isRecent] on the canonical entity this
  /// model is mapped from. Expressed locally (not imported) because this
  /// legacy model does not depend on the canonical value-object layer.
  bool get isStale =>
      observedAt == null ||
      DateTime.now().difference(observedAt!).inHours > 6;
}