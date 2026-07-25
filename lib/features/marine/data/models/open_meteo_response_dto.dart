import 'marine_weather_dto.dart';
import 'weather_dto.dart';

/// Container for all Open-Meteo data returned by the
/// MarineRemoteDataSource.
///
/// This object is passed to the repository where it will
/// be combined with other providers such as WorldTides.
class OpenMeteoResponseDto {
  final WeatherDto weather;
  final MarineWeatherDto marine;

  const OpenMeteoResponseDto({
    required this.weather,
    required this.marine,
  });
}