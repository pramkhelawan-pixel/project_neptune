import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:project_neptune/features/marine/data/datasources/marine_remote_data_source.dart';
import 'package:project_neptune/features/marine/data/datasources/tide_remote_data_source.dart';
import 'package:project_neptune/features/marine/data/models/marine_weather_dto.dart';
import 'package:project_neptune/features/marine/data/models/open_meteo_response_dto.dart';
import 'package:project_neptune/features/marine/data/models/tide_dto.dart';
import 'package:project_neptune/features/marine/data/models/weather_dto.dart';
import 'package:project_neptune/features/marine/data/repositories/marine_repository_impl.dart';
import 'package:project_neptune/features/marine/domain/value_objects/location_conditions.dart';

class MockMarineRemoteDataSource extends Mock
    implements MarineRemoteDataSource {}

class MockTideRemoteDataSource extends Mock implements TideRemoteDataSource {}

const _location = LocationConditions(
  country: 'South Africa',
  province: 'Western Cape',
  region: 'Cape Town',
  beach: 'Test Beach',
  latitude: -33.9249,
  longitude: 18.4241,
);

const _tide = TideDto(
  status: 200,
  station: 'test-station',
  heights: [],
  extremes: [],
  source: 'fresh',
);

OpenMeteoResponseDto _response({required double waterTemperature}) {
  return OpenMeteoResponseDto(
    weather: WeatherDto(
      windSpeed: 10,
      windDirection: 180,
      windGust: 15,
      airTemperature: 22,
      humidity: 60,
      pressure: 1015,
      visibility: 10000,
      cloudCover: 20,
      precipitation: 0,
      precipitationProbability: 0,
      sunrise: DateTime(2026, 1, 1, 5, 30),
      sunset: DateTime(2026, 1, 1, 19, 30),
    ),
    marine: MarineWeatherDto(
      waveHeight: 1.5,
      wavePeriod: 8.0,
      seaSurfaceTemperature: waterTemperature,
      swellWaveHeight: 1.2,
      swellWavePeriod: 7.0,
      swellWaveDirection: 180,
    ),
  );
}

void main() {
  late MockMarineRemoteDataSource marineDataSource;
  late MockTideRemoteDataSource tideDataSource;
  late MarineRepositoryImpl repository;

  setUp(() {
    marineDataSource = MockMarineRemoteDataSource();
    tideDataSource = MockTideRemoteDataSource();
    repository = MarineRepositoryImpl(
      marineRemoteDataSource: marineDataSource,
      tideRemoteDataSource: tideDataSource,
    );

    when(
      () => tideDataSource.getTides(
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    ).thenAnswer((_) async => _tide);
  });

  group('MarineRepositoryImpl - last-known-good cache', () {
    test('a successful fetch returns live conditions', () async {
      when(
        () => marineDataSource.getMarineConditions(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer((_) async => _response(waterTemperature: 14.7));

      final result = await repository.getCurrentConditions(
        location: _location,
      );

      expect(result.water.temperature, 14.7);
    });

    test(
      'a second success replaces the cache rather than reusing the first '
      'value',
      () async {
        var callCount = 0;
        when(
          () => marineDataSource.getMarineConditions(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).thenAnswer((_) async {
          callCount++;
          return _response(waterTemperature: callCount == 1 ? 14.7 : 18.3);
        });

        final first = await repository.getCurrentConditions(
          location: _location,
        );
        final second = await repository.getCurrentConditions(
          location: _location,
        );

        expect(first.water.temperature, 14.7);
        expect(second.water.temperature, 18.3);
      },
    );

    test(
      'a failure with no prior success propagates the honest error, no '
      'fabrication',
      () async {
        when(
          () => marineDataSource.getMarineConditions(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).thenThrow(Exception('network down'));

        await expectLater(
          repository.getCurrentConditions(location: _location),
          throwsA(isA<Exception>()),
        );
      },
    );

    test(
      'a failure after a prior success returns the cached value without '
      'throwing',
      () async {
        var callCount = 0;
        when(
          () => marineDataSource.getMarineConditions(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).thenAnswer((_) async {
          callCount++;
          if (callCount == 1) {
            return _response(waterTemperature: 14.7);
          }
          throw Exception('network down');
        });

        final first = await repository.getCurrentConditions(
          location: _location,
        );
        final second = await repository.getCurrentConditions(
          location: _location,
        );

        expect(second.water.temperature, first.water.temperature);
      },
    );

    test(
      'the cached fallback preserves the original observedAt rather than '
      'stamping the time of the failed request',
      () async {
        var callCount = 0;
        when(
          () => marineDataSource.getMarineConditions(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).thenAnswer((_) async {
          callCount++;
          if (callCount == 1) {
            return _response(waterTemperature: 14.7);
          }
          throw Exception('network down');
        });

        final first = await repository.getCurrentConditions(
          location: _location,
        );
        await Future<void>.delayed(const Duration(milliseconds: 5));
        final second = await repository.getCurrentConditions(
          location: _location,
        );

        expect(second.metadata.observedAt, first.metadata.observedAt);
      },
    );

    test(
      'a later success after a cached fallback replaces the cache with '
      'fresh data again',
      () async {
        var callCount = 0;
        when(
          () => marineDataSource.getMarineConditions(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).thenAnswer((_) async {
          callCount++;
          if (callCount == 2) {
            throw Exception('network down');
          }
          return _response(waterTemperature: callCount == 1 ? 14.7 : 19.9);
        });

        final first = await repository.getCurrentConditions(
          location: _location,
        );
        final cached = await repository.getCurrentConditions(
          location: _location,
        );
        final recovered = await repository.getCurrentConditions(
          location: _location,
        );

        expect(cached.water.temperature, first.water.temperature);
        expect(recovered.water.temperature, 19.9);
        expect(recovered.water.temperature, isNot(first.water.temperature));
      },
    );

    test(
      'a cached fallback does not make an additional data-source call',
      () async {
        var callCount = 0;
        when(
          () => marineDataSource.getMarineConditions(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).thenAnswer((_) async {
          callCount++;
          if (callCount == 1) {
            return _response(waterTemperature: 14.7);
          }
          throw Exception('network down');
        });

        await repository.getCurrentConditions(location: _location);
        await repository.getCurrentConditions(location: _location);

        verify(
          () => marineDataSource.getMarineConditions(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).called(2);
      },
    );
  });
}
