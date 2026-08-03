// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: solar_conditions_mapper.dart
//
// Purpose:
// Maps Open-Meteo weather observations into Neptune's canonical
// SolarConditions value object.
//
// -----------------------------------------------------------------------------

import '../../domain/value_objects/solar_conditions.dart';

import '../models/weather_dto.dart';

class SolarConditionsMapper {
  const SolarConditionsMapper._();

  static SolarConditions toDomain(
      WeatherDto dto,
      ) {
    return SolarConditions(
      sunrise: dto.sunrise,
      sunset: dto.sunset,
    );
  }
}