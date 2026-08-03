// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: water_conditions_mapper.dart
//
// Purpose:
// Maps marine provider observations into Neptune's canonical
// WaterConditions value object.
//
// -----------------------------------------------------------------------------


import '../../domain/enums/water_colour.dart';
import '../../domain/value_objects/water_conditions.dart';

import '../models/marine_weather_dto.dart';

class WaterConditionsMapper {
  const WaterConditionsMapper._();

  static WaterConditions toDomain(
      MarineWeatherDto dto,
      ) {
    return WaterConditions(
      // Open-Meteo marine currently does not expose sea
      // surface temperature through the configured endpoint.
      temperature: 20.0,

      // Water clarity provider planned.
      clarity: 2.0,

      // Estimated until satellite colour integration.
      colour: WaterColour.blueGreen,

      // Average ocean salinity.
      salinity: 35.0,
    );
  }
}