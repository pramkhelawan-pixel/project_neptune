import '../../domain/models/marine_conditions.dart';
import '../models/marine_weather_dto.dart';

class MarineMapper {
  const MarineMapper._();

  static MarineConditions toDomain(MarineWeatherDto dto) {
    return MarineConditions(
      windSpeed: dto.windSpeed,
      windDirection: _degreesToCompass(dto.windDirection),
      swellHeight: dto.waveHeight,
      swellPeriod: dto.wavePeriod,

      // Temporary placeholders until additional
      // data providers are integrated.
      tide: 'Not Available',
      moonPhase: 'Not Available',

      // Temporary placeholders until astronomy
      // integration is added.
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

    final index = ((degrees + 22.5) ~/ 45) % 8;

    return directions[index];
  }
}