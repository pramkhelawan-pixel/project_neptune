import '../../domain/models/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';
import '../datasources/marine_remote_data_source.dart';

class MarineRepositoryImpl implements MarineRepository {
  final MarineRemoteDataSource remoteDataSource;

  const MarineRepositoryImpl({
    this.remoteDataSource = const MockMarineRemoteDataSource(),
  });

  @override
  Future<MarineConditions> getMarineConditions() {
    return remoteDataSource.getMarineConditions();
  }
}