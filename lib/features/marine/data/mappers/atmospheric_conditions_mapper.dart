// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: atmospheric_conditions_mapper.dart
//
// Purpose:
// Maps Open-Meteo weather observations into Neptune's canonical
// AtmosphericConditions value object.
//
// -----------------------------------------------------------------------------

import '../../domain/enums/cloud_cover.dart';
import '../../domain/value_objects/atmospheric_conditions.dart';

import '../models/weather_dto.dart';

class AtmosphericConditionsMapper {
  const AtmosphericConditionsMapper._();

  static AtmosphericConditions toDomain(
      WeatherDto dto,
      ) {
    return AtmosphericConditions(
      pressure: dto.pressure,
      humidity: dto.humidity,
      airTemperature: dto.airTemperature,
      visibility: dto.visibility,
      cloudCover: _mapCloudCover(dto.cloudCover),
      precipitation: dto.precipitation,
      precipitationProbability: dto.precipitationProbability,
    );
  }

  static CloudCover _mapCloudCover(
      double percentage,
      ) {
    if (percentage < 10) {
      return CloudCover.clear;
    }

    if (percentage < 30) {
      return CloudCover.mostlyClear;
    }

    if (percentage < 60) {
      return CloudCover.partlyCloudy;
    }

    if (percentage < 90) {
      return CloudCover.mostlyCloudy;
    }

    return CloudCover.overcast;
  }
}