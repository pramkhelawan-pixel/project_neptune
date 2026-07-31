import '../../domain/models/marine_conditions.dart';
import '../models/marine_weather_dto.dart';
import '../models/weather_dto.dart';

class MarineMapper {
  const MarineMapper._();

  static MarineConditions toDomain({
    required WeatherDto weather,
    required MarineWeatherDto marine,
  }) {
    return MarineConditions(
      windSpeed: weather.windSpeed,

      windDirection: _windDirection(
        weather.windDirection,
      ),

      swellHeight: marine.waveHeight,

      swellPeriod: marine.wavePeriod,

      // TODO(Neptune):
      // Replace with real sea surface temperature once supported
      // by the marine provider.
      waterTemperature: 20.0,

      // TODO(Neptune):
      // Replace with real air temperature from the weather API.
      airTemperature: 22.0,

      // TODO(Neptune):
      // Replace with real atmospheric pressure from the weather API.
      atmosphericPressure: 1015.0,

      tide: 'Unknown',

      tideHeight: 0,

      nextHighTide: null,

      nextLowTide: null,

      tideState: 'Unknown',

      moonPhase: 'Not Available',

      sunrise: weather.sunrise,

      sunset: weather.sunset,
    );
  }

  static String _windDirection(double degrees) {
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