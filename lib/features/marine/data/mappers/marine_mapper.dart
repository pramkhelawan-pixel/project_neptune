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
      windDirection: _degreesToCompass(weather.windDirection),
      swellHeight: marine.waveHeight,
      swellPeriod: marine.wavePeriod,

      // Temporary placeholders until dedicated
      // providers are integrated.
      tide: 'Not Available',
      moonPhase: 'Not Available',

      // Temporary placeholders until astronomy integration.
      sunrise: DateTime.now(),
      sunset: DateTime.now(),
    );
  }

  static String _degreesToCompass(double degrees) {
    const directions = [
      'N',
      'NE',
      'E',
      'SE',
      'S',
      'SW',
      'W',
      'NW',
    ];

    final normalized = degrees % 360;
    final index = ((normalized + 22.5) ~/ 45) % directions.length;

    return directions[index];
  }
}