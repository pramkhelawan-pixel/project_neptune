import '../../domain/entities/marine_conditions.dart' as entity;
import '../../domain/models/marine_conditions.dart' as legacy;

/// Temporary compatibility mapper.
///
/// This allows the application to continue using the legacy
/// MarineConditions model while the rest of the project is migrated
/// to the canonical entity.
///
/// NOTE:
/// This is intentionally incomplete and will be expanded as the
/// migration progresses.
class MarineConditionsLegacyMapper {
  const MarineConditionsLegacyMapper._();

  static legacy.MarineConditions toLegacy(
      entity.MarineConditions source,
      ) {
    return legacy.MarineConditions(
      windSpeed: source.wind.speed,
      windDirection: source.wind.direction.abbreviation,
      swellHeight: source.swell.height,
      swellPeriod: source.swell.period,
      waterTemperature: source.water.temperature,
      airTemperature: source.atmosphere.airTemperature,
      atmosphericPressure: source.atmosphere.pressure,
      tide: source.tide.state.displayName,
      tideHeight: source.tide.height,
      tideState: source.tide.state.displayName,
      nextHighTide: source.tide.nextHigh,
      nextLowTide: source.tide.nextLow,
      moonPhase: source.moon.phase.displayName,
      sunrise: source.sun.sunrise,
      sunset: source.sun.sunset,
    );
  }
}