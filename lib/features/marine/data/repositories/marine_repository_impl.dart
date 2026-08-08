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
import '../../../../core/services/supabase_service.dart';


import '../../domain/entities/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';
import '../../domain/value_objects/location_conditions.dart';

import '../datasources/marine_remote_data_source.dart';
import '../datasources/tide_remote_data_source.dart';
import '../../domain/value_objects/observation_metadata.dart';

import '../assemblers/marine_conditions_assembler.dart';
import '../mappers/atmospheric_conditions_mapper.dart';
import '../mappers/current_conditions_mapper.dart';
import '../mappers/location_conditions_mapper.dart';
import '../mappers/lunar_conditions_mapper.dart';
import '../mappers/solar_conditions_mapper.dart';
import '../mappers/swell_conditions_mapper.dart';
import '../mappers/tide_conditions_mapper.dart';
import '../mappers/water_conditions_mapper.dart';
import '../mappers/wind_conditions_mapper.dart';

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
                  client: SupabaseService.client,
                );

  @override
  Future<MarineConditions> getCurrentConditions({
    required LocationConditions location,
  }) async {
    final response = await marineRemoteDataSource.getMarineConditions();

    final tideDto = await tideRemoteDataSource.getTides(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    return MarineConditionsAssembler.assemble(
      wind: WindConditionsMapper.toDomain(response.weather),
      tide: TideConditionsMapper.toDomain(tideDto),
      swell: SwellConditionsMapper.toDomain(response.marine),
      current: CurrentConditionsMapper.toDomain(),
      water: WaterConditionsMapper.toDomain(response.marine),
      atmosphere: AtmosphericConditionsMapper.toDomain(response.weather),
      moon: LunarConditionsMapper.toDomain(),
      sun: SolarConditionsMapper.toDomain(response.weather),
      location: LocationConditionsMapper.toDomain(
        latitude: location.latitude,
        longitude: location.longitude,
      ),
      metadata: ObservationMetadata(
        observedAt: DateTime.now(),
        publishedAt: DateTime.now(),
        provider: 'Open-Meteo / WorldTides',
        confidence: 95.0,
      ),
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