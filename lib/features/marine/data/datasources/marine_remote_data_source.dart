import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../models/marine_weather_dto.dart';
import '../models/open_meteo_response_dto.dart';
import '../models/weather_dto.dart';

/// Defines how marine data is retrieved.
abstract class MarineRemoteDataSource {
  Future<OpenMeteoResponseDto> getMarineConditions({
    required double latitude,
    required double longitude,
  });
}

/// Retrieves live weather and marine observations from Open-Meteo.
class OpenMeteoRemoteDataSource implements MarineRemoteDataSource {
  final ApiClient apiClient;

  const OpenMeteoRemoteDataSource({
    required this.apiClient,
  });

  @override
  Future<OpenMeteoResponseDto> getMarineConditions({
    required double latitude,
    required double longitude,
  }) async {
    final weatherResponse = await apiClient.getFromBaseUrl(
      baseUrl: ApiConstants.weatherBaseUrl,
      endpoint: ApiConstants.weatherForecast,
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'hourly':
        'wind_speed_10m,'
            'wind_direction_10m,'
            'wind_gusts_10m,'
            'temperature_2m,'
            'relative_humidity_2m,'
            'pressure_msl,'
            'visibility,'
            'cloud_cover,'
            'precipitation,'
            'precipitation_probability',
        'daily': 'sunrise,sunset',
        'timezone': 'Africa/Johannesburg',
        'forecast_days': 1,
      },
    );

    final marineResponse = await apiClient.getFromBaseUrl(
      baseUrl: ApiConstants.marineBaseUrl,
      endpoint: ApiConstants.marineForecast,
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'hourly': 'wave_height,wave_period,sea_surface_temperature',
        'timezone': 'Africa/Johannesburg',
        'forecast_days': 1,
      },
    );

    return OpenMeteoResponseDto(
      weather: WeatherDto.fromJson(
        weatherResponse.data as Map<String, dynamic>,
      ),
      marine: MarineWeatherDto.fromJson(
        marineResponse.data as Map<String, dynamic>,
      ),
    );
  }
}