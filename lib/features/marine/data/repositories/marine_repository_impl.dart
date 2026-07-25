import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../../domain/models/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';

import '../datasources/marine_remote_data_source.dart';
import '../datasources/tide_remote_data_source.dart';

import '../mappers/tide_mapper.dart';

class MarineRepositoryImpl implements MarineRepository {
  final MarineRemoteDataSource marineRemoteDataSource;
  final TideRemoteDataSource tideRemoteDataSource;

  MarineRepositoryImpl({
    MarineRemoteDataSource? marineRemoteDataSource,
    TideRemoteDataSource? tideRemoteDataSource,
  })  : marineRemoteDataSource =
      marineRemoteDataSource ??
          OpenMeteoRemoteDataSource(
            apiClient: ApiClient(),
          ),
        tideRemoteDataSource =
            tideRemoteDataSource ??
                TideRemoteDataSource(
                  apiClient: ApiClient(),
                );

  @override
  Future<MarineConditions> getMarineConditions() async {
    // Get Open-Meteo marine conditions.
    final marineConditions =
    await marineRemoteDataSource.getMarineConditions();

    // Get WorldTides data.
    final tideDto = await tideRemoteDataSource.getTides(
      latitude: ApiConstants.durbanLatitude,
      longitude: ApiConstants.durbanLongitude,
    );

    // Merge tide intelligence into the existing model.
    return TideMapper.toDomain(
      currentConditions: marineConditions,
      tide: tideDto,
    );
  }
}