import '../../../../core/config/app_config.dart';
import '../../../../core/network/api_client.dart';

import '../models/tide_dto.dart';

class TideRemoteDataSource {
  final ApiClient _apiClient;

  TideRemoteDataSource({
    ApiClient? apiClient,
  }) : _apiClient = apiClient ?? ApiClient();

  Future<TideDto> getTides({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _apiClient.getFromBaseUrl(
      baseUrl: 'https://www.worldtides.info',
      endpoint: '/api/v3',
      queryParameters: {
        'heights': '',
        'extremes': '',
        'lat': latitude,
        'lon': longitude,
        'key': AppConfig.worldTidesApiKey,
      },
    );

    return TideDto.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}