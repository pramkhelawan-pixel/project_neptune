import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:project_neptune/core/network/network_exception.dart';
import 'package:project_neptune/features/marine/data/datasources/tide_remote_data_source.dart';
import 'package:project_neptune/features/marine/data/models/tide_dto.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockFunctionsClient extends Mock implements FunctionsClient {}

Map<String, dynamic> _envelope({
  required String source,
  String? warning,
  int status = 200,
}) {
  return {
    'data': {
      'status': status,
      'station': 'Durban',
      'error': null,
      'heights': <dynamic>[
        {'dt': 1000, 'date': '2026-08-08T00:00:00.000Z', 'height': 1.2},
      ],
      'extremes': <dynamic>[
        {
          'dt': 2000,
          'date': '2026-08-08T06:00:00.000Z',
          'height': 1.8,
          'type': 'High',
        },
      ],
    },
    'source': source,
    'warning': warning,
  };
}

void main() {
  group('TideDto.fromJson', () {
    test('unwraps heights/extremes from the nested data object', () {
      final dto = TideDto.fromJson(_envelope(source: 'fresh'));

      expect(dto.status, 200);
      expect(dto.station, 'Durban');
      expect(dto.heights, hasLength(1));
      expect(dto.extremes, hasLength(1));
    });

    test('parses source/warning for a cache hit', () {
      final dto = TideDto.fromJson(_envelope(source: 'cache'));

      expect(dto.source, 'cache');
      expect(dto.warning, isNull);
    });

    test('parses source/warning for a stale fallback', () {
      final dto = TideDto.fromJson(
        _envelope(
          source: 'stale_fallback',
          warning: 'WorldTides unavailable; showing tide data last updated 2026-08-08T00:00:00.000Z',
        ),
      );

      expect(dto.source, 'stale_fallback');
      expect(dto.warning, isNotNull);
    });

    test('Equatable distinguishes DTOs that differ only by source/warning', () {
      final fresh = TideDto.fromJson(_envelope(source: 'fresh'));
      final stale = TideDto.fromJson(
        _envelope(source: 'stale_fallback', warning: 'stale'),
      );

      expect(fresh, isNot(equals(stale)));
    });

    test('Equatable treats identical envelopes as equal', () {
      final a = TideDto.fromJson(_envelope(source: 'cache'));
      final b = TideDto.fromJson(_envelope(source: 'cache'));

      expect(a, equals(b));
    });
  });

  group('TideRemoteDataSource', () {
    late MockSupabaseClient mockClient;
    late MockFunctionsClient mockFunctions;
    late TideRemoteDataSource dataSource;

    setUp(() {
      mockClient = MockSupabaseClient();
      mockFunctions = MockFunctionsClient();
      when(() => mockClient.functions).thenReturn(mockFunctions);
      dataSource = TideRemoteDataSource(client: mockClient);
    });

    test('returns a parsed TideDto on success', () async {
      when(
        () => mockFunctions.invoke(
          'get-tides',
          body: any(named: 'body'),
        ),
      ).thenAnswer(
        (_) async => FunctionResponse(
          data: _envelope(source: 'fresh'),
          status: 200,
        ),
      );

      final dto = await dataSource.getTides(
        latitude: -29.86,
        longitude: 31.02,
      );

      expect(dto.source, 'fresh');
      verify(
        () => mockFunctions.invoke(
          'get-tides',
          body: {'latitude': -29.86, 'longitude': 31.02},
        ),
      ).called(1);
    });

    test(
      'translates a 4xx FunctionException into NetworkException without retrying',
      () async {
        when(
          () => mockFunctions.invoke(any(), body: any(named: 'body')),
        ).thenThrow(
          const FunctionException(status: 401, reasonPhrase: 'Unauthorized'),
        );

        await expectLater(
          () => dataSource.getTides(latitude: -29.86, longitude: 31.02),
          throwsA(isA<NetworkException>()),
        );

        verify(
          () => mockFunctions.invoke(any(), body: any(named: 'body')),
        ).called(1);
      },
    );

    test(
      'retries once on a 5xx FunctionException, then succeeds',
      () async {
        var callCount = 0;

        when(
          () => mockFunctions.invoke(any(), body: any(named: 'body')),
        ).thenAnswer((_) async {
          callCount++;
          if (callCount == 1) {
            throw const FunctionException(
              status: 503,
              reasonPhrase: 'Service Unavailable',
            );
          }
          return FunctionResponse(
            data: _envelope(source: 'fresh'),
            status: 200,
          );
        });

        final dto = await dataSource.getTides(
          latitude: -29.86,
          longitude: 31.02,
        );

        expect(dto.source, 'fresh');
        expect(callCount, 2);
      },
    );

    test(
      'gives up after a second consecutive 5xx FunctionException',
      () async {
        when(
          () => mockFunctions.invoke(any(), body: any(named: 'body')),
        ).thenThrow(
          const FunctionException(
            status: 503,
            reasonPhrase: 'Service Unavailable',
          ),
        );

        await expectLater(
          () => dataSource.getTides(latitude: -29.86, longitude: 31.02),
          throwsA(isA<NetworkException>()),
        );
      },
    );
  });
}
