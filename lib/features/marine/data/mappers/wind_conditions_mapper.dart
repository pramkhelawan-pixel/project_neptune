// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: wind_conditions_mapper.dart
//
// Purpose:
// Maps Open-Meteo weather observations into Neptune's canonical
// WindConditions value object.
//
// -----------------------------------------------------------------------------

import '../../domain/enums/wind_direction.dart';
import '../../domain/value_objects/wind_conditions.dart';

import '../models/weather_dto.dart';

class WindConditionsMapper {
  const WindConditionsMapper._();

  static WindConditions toDomain(
      WeatherDto dto,
      ) {
    return WindConditions(
      speed: dto.windSpeed,
      direction: _directionFromDegrees(dto.windDirection),
      gust: dto.windGust,
    );
  }

  static WindDirection _directionFromDegrees(
      double degrees,
      ) {
    if (degrees >= 337.5 || degrees < 22.5) {
      return WindDirection.north;
    }

    if (degrees < 67.5) {
      return WindDirection.northEast;
    }

    if (degrees < 112.5) {
      return WindDirection.east;
    }

    if (degrees < 157.5) {
      return WindDirection.southEast;
    }

    if (degrees < 202.5) {
      return WindDirection.south;
    }

    if (degrees < 247.5) {
      return WindDirection.southWest;
    }

    if (degrees < 292.5) {
      return WindDirection.west;
    }

    return WindDirection.northWest;
  }
}