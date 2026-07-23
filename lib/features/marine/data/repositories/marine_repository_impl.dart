import '../../../../core/network/api_client.dart';
import '../../domain/models/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';
import '../datasources/marine_remote_data_source.dart';

class MarineRepositoryImpl implements MarineRepository {
  final MarineRemoteDataSource remoteDataSource;

  MarineRepositoryImpl({
    MarineRemoteDataSource? remoteDataSource,
  }) : remoteDataSource =
      remoteDataSource ??
          OpenMeteoRemoteDataSource(
            apiClient: ApiClient(),
          );

  @override
  Future<MarineConditions> getMarineConditions() {
    return remoteDataSource.getMarineConditions();
  }
}