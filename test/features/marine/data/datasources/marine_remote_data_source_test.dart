import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:project_neptune/core/network/api_client.dart';
import 'package:project_neptune/features/marine/data/datasources/marine_remote_data_source.dart';
import 'package:project_neptune/features/marine/data/mappers/swell_conditions_mapper.dart';
import 'package:project_neptune/features/marine/data/mappers/water_conditions_mapper.dart';

class MockApiClient extends Mock implements ApiClient {}

Response<dynamic> _weatherResponse() {
  return Response(
    requestOptions: RequestOptions(path: '/forecast'),
    data: {
      'hourly': {
        'wind_speed_10m': [10.0],
        'wind_direction_10m': [180.0],
        'wind_gusts_10m': [15.0],
        'temperature_2m': [22.0],
        'relative_humidity_2m': [60.0],
        'pressure_msl': [1015.0],
        'visibility': [10000.0],
        'cloud_cover': [40.0],
        'precipitation': [0.0],
        'precipitation_probability': [5.0],
      },
      'daily': {
        'sunrise': ['2026-01-01T05:30:00.000'],
        'sunset': ['2026-01-01T19:30:00.000'],
      },
    },
  );
}

Response<dynamic> _marineResponse({
  double seaSurfaceTemperature = 16.4,
  double waveHeight = 2.0,
  double wavePeriod = 10.2,
  double swellWaveHeight = 1.5,
  double swellWavePeriod = 8.0,
}) {
  return Response(
    requestOptions: RequestOptions(path: '/marine'),
    data: {
      'hourly': {
        'wave_height': [waveHeight],
        'wave_period': [wavePeriod],
        'sea_surface_temperature': [seaSurfaceTemperature],
        'swell_wave_height': [swellWaveHeight],
        'swell_wave_period': [swellWavePeriod],
      },
    },
  );
}

void main() {
  setUpAll(() {
    registerFallbackValue(<String, dynamic>{});
  });

  group('OpenMeteoRemoteDataSource.getMarineConditions', () {
    test(
      'sends the caller-supplied latitude/longitude to both the weather and '
      'marine endpoints, not a hardcoded Durban coordinate',
      () async {
        final mockApiClient = MockApiClient();
        final dataSource = OpenMeteoRemoteDataSource(
          apiClient: mockApiClient,
        );

        final capturedQueryParams = <Map<String, dynamic>>[];

        when(
          () => mockApiClient.getFromBaseUrl(
            baseUrl: any(named: 'baseUrl'),
            endpoint: any(named: 'endpoint'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((invocation) async {
          final params = invocation.namedArguments[#queryParameters]
              as Map<String, dynamic>;
          capturedQueryParams.add(params);

          final endpoint = invocation.namedArguments[#endpoint] as String;
          return endpoint == '/forecast' ? _weatherResponse() : _marineResponse();
        });

        // Cape Town — deliberately not Durban, to prove the coordinates
        // actually flow through rather than being silently ignored.
        const capeTownLatitude = -33.9249;
        const capeTownLongitude = 18.4241;

        await dataSource.getMarineConditions(
          latitude: capeTownLatitude,
          longitude: capeTownLongitude,
        );

        expect(capturedQueryParams, hasLength(2));

        for (final params in capturedQueryParams) {
          expect(params['latitude'], capeTownLatitude);
          expect(params['longitude'], capeTownLongitude);
          // The historical Durban Harbour constants must never appear.
          expect(params['latitude'], isNot(-29.8716));
          expect(params['longitude'], isNot(31.0464));
        }
      },
    );

    test(
      'a different coordinate pair produces a different request than another',
      () async {
        final mockApiClient = MockApiClient();
        final dataSource = OpenMeteoRemoteDataSource(
          apiClient: mockApiClient,
        );

        final capturedLatitudes = <dynamic>[];

        when(
          () => mockApiClient.getFromBaseUrl(
            baseUrl: any(named: 'baseUrl'),
            endpoint: any(named: 'endpoint'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((invocation) async {
          final params = invocation.namedArguments[#queryParameters]
              as Map<String, dynamic>;
          capturedLatitudes.add(params['latitude']);

          final endpoint = invocation.namedArguments[#endpoint] as String;
          return endpoint == '/forecast' ? _weatherResponse() : _marineResponse();
        });

        await dataSource.getMarineConditions(latitude: 1.0, longitude: 2.0);
        await dataSource.getMarineConditions(latitude: 51.5, longitude: -0.1);

        expect(capturedLatitudes, containsAll(<double>[1.0, 51.5]));
      },
    );

    test(
      'requests sea_surface_temperature alongside wave_height/wave_period '
      'on the existing marine endpoint - no second request is made',
      () async {
        final mockApiClient = MockApiClient();
        final dataSource = OpenMeteoRemoteDataSource(
          apiClient: mockApiClient,
        );

        final requestedEndpoints = <String>[];
        String? marineHourlyParam;

        when(
          () => mockApiClient.getFromBaseUrl(
            baseUrl: any(named: 'baseUrl'),
            endpoint: any(named: 'endpoint'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((invocation) async {
          final endpoint = invocation.namedArguments[#endpoint] as String;
          requestedEndpoints.add(endpoint);

          if (endpoint == '/marine') {
            final params = invocation.namedArguments[#queryParameters]
                as Map<String, dynamic>;
            marineHourlyParam = params['hourly'] as String;
          }

          return endpoint == '/forecast' ? _weatherResponse() : _marineResponse();
        });

        await dataSource.getMarineConditions(latitude: -33.9249, longitude: 18.4241);

        // Still exactly one weather call and one marine call - SST must not
        // introduce a third request.
        expect(requestedEndpoints, ['/forecast', '/marine']);
        expect(marineHourlyParam, contains('sea_surface_temperature'));
      },
    );

    test(
      'a supplied sea_surface_temperature value flows all the way through '
      'to WaterConditionsMapper - never the old hardcoded 20.0',
      () async {
        final mockApiClient = MockApiClient();
        final dataSource = OpenMeteoRemoteDataSource(
          apiClient: mockApiClient,
        );

        when(
          () => mockApiClient.getFromBaseUrl(
            baseUrl: any(named: 'baseUrl'),
            endpoint: any(named: 'endpoint'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((invocation) async {
          final endpoint = invocation.namedArguments[#endpoint] as String;
          return endpoint == '/forecast'
              ? _weatherResponse()
              : _marineResponse(seaSurfaceTemperature: 14.7);
        });

        final response = await dataSource.getMarineConditions(
          latitude: -33.9249,
          longitude: 18.4241,
        );

        expect(response.marine.seaSurfaceTemperature, 14.7);

        final water = WaterConditionsMapper.toDomain(response.marine);
        expect(water.temperature, 14.7);
        expect(water.temperature, isNot(20.0));
      },
    );

    test(
      'requests swell_wave_height and swell_wave_period alongside the '
      'existing marine parameters - no second marine request is made',
      () async {
        final mockApiClient = MockApiClient();
        final dataSource = OpenMeteoRemoteDataSource(
          apiClient: mockApiClient,
        );

        final requestedEndpoints = <String>[];
        String? marineHourlyParam;

        when(
          () => mockApiClient.getFromBaseUrl(
            baseUrl: any(named: 'baseUrl'),
            endpoint: any(named: 'endpoint'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((invocation) async {
          final endpoint = invocation.namedArguments[#endpoint] as String;
          requestedEndpoints.add(endpoint);

          if (endpoint == '/marine') {
            final params = invocation.namedArguments[#queryParameters]
                as Map<String, dynamic>;
            marineHourlyParam = params['hourly'] as String;
          }

          return endpoint == '/forecast' ? _weatherResponse() : _marineResponse();
        });

        await dataSource.getMarineConditions(latitude: -33.9249, longitude: 18.4241);

        // Still exactly one weather call and one marine call - swell must
        // not introduce a third request.
        expect(requestedEndpoints, ['/forecast', '/marine']);
        expect(marineHourlyParam, contains('swell_wave_height'));
        expect(marineHourlyParam, contains('swell_wave_period'));
        // The pre-existing parameters must still be present too.
        expect(marineHourlyParam, contains('wave_height'));
        expect(marineHourlyParam, contains('wave_period'));
        expect(marineHourlyParam, contains('sea_surface_temperature'));
      },
    );

    test(
      'supplied swell_wave_height/period values are parsed correctly and '
      'flow through to SwellConditionsMapper as true swell - never the '
      'generic wave_height/wave_period values, and direction stays '
      '"Unknown"',
      () async {
        final mockApiClient = MockApiClient();
        final dataSource = OpenMeteoRemoteDataSource(
          apiClient: mockApiClient,
        );

        when(
          () => mockApiClient.getFromBaseUrl(
            baseUrl: any(named: 'baseUrl'),
            endpoint: any(named: 'endpoint'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((invocation) async {
          final endpoint = invocation.namedArguments[#endpoint] as String;
          return endpoint == '/forecast'
              ? _weatherResponse()
              : _marineResponse(
                  waveHeight: 2.0,
                  wavePeriod: 10.2,
                  swellWaveHeight: 1.76,
                  swellWavePeriod: 7.65,
                );
        });

        final response = await dataSource.getMarineConditions(
          latitude: -33.9249,
          longitude: 18.4241,
        );

        // The DTO must keep both the generic wave values and the true
        // swell values distinct - one must not overwrite the other.
        expect(response.marine.waveHeight, 2.0);
        expect(response.marine.wavePeriod, 10.2);
        expect(response.marine.swellWaveHeight, 1.76);
        expect(response.marine.swellWavePeriod, 7.65);

        final swell = SwellConditionsMapper.toDomain(response.marine);
        expect(swell.height, 1.76);
        expect(swell.period, 7.65);
        // Never the generic wave values.
        expect(swell.height, isNot(2.0));
        expect(swell.period, isNot(10.2));
        // Direction is explicitly out of scope for this change.
        expect(swell.direction, 'Unknown');
      },
    );
  });
}
