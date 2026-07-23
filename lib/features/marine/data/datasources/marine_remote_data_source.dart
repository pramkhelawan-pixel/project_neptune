import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';
import '../../domain/models/marine_conditions.dart';
import '../mappers/marine_mapper.dart';
import '../models/marine_weather_dto.dart';
import '../models/weather_dto.dart';

/// Defines how marine data is retrieved.
abstract class MarineRemoteDataSource {
  Future<MarineConditions> getMarineConditions();
}

/// Retrieves live marine conditions from Open-Meteo.
class OpenMeteoRemoteDataSource implements MarineRemoteDataSource {
  final ApiClient apiClient;

  const OpenMeteoRemoteDataSource({
    required this.apiClient,
  });

  @override
  Future<MarineConditions> getMarineConditions() async {
    final weatherResponse = await apiClient.getFromBaseUrl(
      baseUrl: ApiConstants.weatherBaseUrl,
      endpoint: ApiConstants.weatherForecast,
      queryParameters: {
        'latitude': ApiConstants.durbanLatitude,
        'longitude': ApiConstants.durbanLongitude,
        'hourly': 'wind_speed_10m,wind_direction_10m',
        'forecast_days': 1,
      },
    );

    final marineResponse = await apiClient.getFromBaseUrl(
      baseUrl: ApiConstants.marineBaseUrl,
      endpoint: ApiConstants.marineForecast,
      queryParameters: {
        'latitude': ApiConstants.durbanLatitude,
        'longitude': ApiConstants.durbanLongitude,
        'hourly': 'wave_height,wave_period',
        'forecast_days': 1,
      },
    );

    final weatherDto = WeatherDto.fromJson(
      weatherResponse.data as Map<String, dynamic>,
    );

    final marineDto = MarineWeatherDto.fromJson(
      marineResponse.data as Map<String, dynamic>,
    );

    return MarineMapper.toDomain(
      weather: weatherDto,
      marine: marineDto,
    );
  }
}