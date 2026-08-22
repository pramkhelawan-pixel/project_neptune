// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: swell_conditions_mapper.dart
//
// Purpose:
// Maps Open-Meteo marine observations into Neptune's canonical
// SwellConditions value object.
//
// -----------------------------------------------------------------------------

import '../../domain/value_objects/swell_conditions.dart';

import '../models/marine_weather_dto.dart';

class SwellConditionsMapper {
  const SwellConditionsMapper._();

  static SwellConditions toDomain(
      MarineWeatherDto dto,
      ) {
    return SwellConditions(
      height: dto.swellWaveHeight,
      period: dto.swellWavePeriod,
      direction: _directionFromDegrees(dto.swellWaveDirection),
    );
  }

  /// Converts a meteorological degree bearing (0-360) to an 8-point compass
  /// abbreviation. Same bucket convention as
  /// `WindConditionsMapper._directionFromDegrees` (45° buckets centred on
  /// each compass point), so 0°/360° both resolve to 'N'.
  static String _directionFromDegrees(
      double degrees,
      ) {
    if (degrees >= 337.5 || degrees < 22.5) {
      return 'N';
    }

    if (degrees < 67.5) {
      return 'NE';
    }

    if (degrees < 112.5) {
      return 'E';
    }

    if (degrees < 157.5) {
      return 'SE';
    }

    if (degrees < 202.5) {
      return 'S';
    }

    if (degrees < 247.5) {
      return 'SW';
    }

    if (degrees < 292.5) {
      return 'W';
    }

    return 'NW';
  }
}