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

      // Open-Meteo does not currently provide swell direction
      // in the configured endpoint.
      direction: 'Unknown',
    );
  }
}