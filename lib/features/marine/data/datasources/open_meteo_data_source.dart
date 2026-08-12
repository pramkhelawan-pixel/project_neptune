// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: open_meteo_data_source.dart
//
// Purpose:
// Retrieves raw environmental observations from the Open-Meteo API.
//
// -----------------------------------------------------------------------------

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../models/marine_weather_dto.dart';
import '../models/open_meteo_response_dto.dart';
import '../models/weather_dto.dart';

abstract class OpenMeteoDataSource {
  Future<OpenMeteoResponseDto> fetchConditions({
    required double latitude,
    required double longitude,
  });
}

class OpenMeteoApiDataSource implements OpenMeteoDataSource {
  final ApiClient apiClient;

  const OpenMeteoApiDataSource({
    required this.apiClient,
  });

  @override
  Future<OpenMeteoResponseDto> fetchConditions({
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
        'hourly': 'wave_height,wave_period',
        'timezone': 'Africa/Johannesburg',
        'forecast_days': 1,
      },
    );

    final weatherDto = WeatherDto.fromJson(
      weatherResponse.data as Map<String, dynamic>,
    );

    final marineDto = MarineWeatherDto.fromJson(
      marineResponse.data as Map<String, dynamic>,
    );

    return OpenMeteoResponseDto(
      weather: weatherDto,
      marine: marineDto,
    );
  }
}