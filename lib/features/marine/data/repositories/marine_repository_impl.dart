// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: marine_repository_impl.dart
//
// Purpose:
// Default implementation of MarineRepository.
//
// This repository coordinates marine data retrieval from remote data sources
// and maps external DTOs into Neptune's canonical MarineConditions entity.
//
// -----------------------------------------------------------------------------

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../../domain/entities/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';
import '../../domain/value_objects/location_conditions.dart';

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
  Future<MarineConditions> getCurrentConditions({
    required LocationConditions location,
  }) async {
    final marineConditions =
    await marineRemoteDataSource.getMarineConditions();

    final tideDto = await tideRemoteDataSource.getTides(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    return TideMapper.toDomain(
      currentConditions: marineConditions,
      tide: tideDto,
    );
  }

  @override
  Future<List<MarineConditions>> getForecast({
    required LocationConditions location,
    required Duration duration,
  }) async {
    // Forecast integration will be implemented when the forecast provider
    // is introduced.
    return [
      await getCurrentConditions(
        location: location,
      ),
    ];
  }

  @override
  Future<List<MarineConditions>> getHistory({
    required LocationConditions location,
    required DateTime from,
    required DateTime to,
  }) async {
    // Historical provider will be implemented in a future sprint.
    return [];
  }

  @override
  Future<void> refresh({
    required LocationConditions location,
  }) async {
    await getCurrentConditions(
      location: location,
    );
  }
}