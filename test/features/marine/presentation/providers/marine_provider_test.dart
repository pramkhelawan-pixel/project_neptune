import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:project_neptune/features/location/domain/user_location_state.dart';
import 'package:project_neptune/features/location/presentation/providers/user_location_provider.dart';
import 'package:project_neptune/features/location/services/user_location_service.dart';

import 'package:project_neptune/features/marine/domain/repositories/marine_repository.dart';
import 'package:project_neptune/features/marine/domain/value_objects/location_conditions.dart';
import 'package:project_neptune/features/marine/presentation/providers/marine_provider.dart';

class FakeUserLocationService implements UserLocationService {
  FakeUserLocationService(this._result);

  final UserLocationState _result;

  @override
  Future<UserLocationState> getCurrentLocation() async => _result;
}

/// Returns a different, pre-scripted result on each successive call —
/// models a real device where the first GPS attempt fails (e.g. a slow
/// permission dialog) and a later, retried attempt succeeds.
class SequencedUserLocationService implements UserLocationService {
  SequencedUserLocationService(this._results);

  final List<UserLocationState> _results;
  int _callCount = 0;

  @override
  Future<UserLocationState> getCurrentLocation() async {
    final result = _results[_callCount.clamp(0, _results.length - 1)];
    _callCount++;
    return result;
  }
}

class MockMarineRepository extends Mock implements MarineRepository {}

class _FakeLocationConditions extends Fake implements LocationConditions {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeLocationConditions());
  });

  ProviderContainer buildContainer({
    required UserLocationState locationState,
    required MarineRepository repository,
  }) {
    final container = ProviderContainer(
      overrides: [
        userLocationServiceProvider.overrideWithValue(
          FakeUserLocationService(locationState),
        ),
        marineRepositoryProvider.overrideWithValue(repository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('marineConditionsProvider - location wiring', () {
    test(
      'a real, non-Durban GPS fix produces a marine request for those exact '
      'coordinates',
      () async {
        LocationConditions? captured;

        final mockRepository = MockMarineRepository();
        when(
          () => mockRepository.getCurrentConditions(
            location: any(named: 'location'),
          ),
        ).thenAnswer((invocation) async {
          captured =
              invocation.namedArguments[#location] as LocationConditions;
          // The mapper isn't exercised here — only the location wiring is
          // under test — so fail fast with a recognisable stub error rather
          // than needing a full canonical MarineConditions fixture.
          throw Exception('stub: not returning real marine data');
        });

        const capeTownLatitude = -33.9249;
        const capeTownLongitude = 18.4241;

        final container = buildContainer(
          locationState: const UserLocationAvailable(
            latitude: capeTownLatitude,
            longitude: capeTownLongitude,
          ),
          repository: mockRepository,
        );

        await expectLater(
          () => container.read(marineConditionsProvider.future),
          throwsException,
        );

        expect(captured, isNotNull);
        expect(captured!.latitude, capeTownLatitude);
        expect(captured!.longitude, capeTownLongitude);
        // Must never be the historical hardcoded Durban coordinates.
        expect(captured!.latitude, isNot(-29.8587));
        expect(captured!.longitude, isNot(31.0218));
      },
    );

    test(
      'permission denied -> fails gracefully without calling the repository, '
      'and never claims Durban',
      () async {
        final mockRepository = MockMarineRepository();

        final container = buildContainer(
          locationState: const UserLocationPermissionDenied(),
          repository: mockRepository,
        );

        await expectLater(
          () => container.read(marineConditionsProvider.future),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'message',
              isNot(contains('Durban')),
            ),
          ),
        );

        verifyNever(
          () => mockRepository.getCurrentConditions(
            location: any(named: 'location'),
          ),
        );
      },
    );

    test(
      'location services unavailable -> fails gracefully without calling '
      'the repository',
      () async {
        final mockRepository = MockMarineRepository();

        final container = buildContainer(
          locationState: const UserLocationUnavailable(
            'Enable location services to use this.',
          ),
          repository: mockRepository,
        );

        await expectLater(
          () => container.read(marineConditionsProvider.future),
          throwsException,
        );

        verifyNever(
          () => mockRepository.getCurrentConditions(
            location: any(named: 'location'),
          ),
        );
      },
    );

    test(
      'unexpected GPS error -> fails gracefully without calling the '
      'repository',
      () async {
        final mockRepository = MockMarineRepository();

        final container = buildContainer(
          locationState: const UserLocationError(
            "Couldn't get your location. Try again.",
          ),
          repository: mockRepository,
        );

        await expectLater(
          () => container.read(marineConditionsProvider.future),
          throwsException,
        );

        verifyNever(
          () => mockRepository.getCurrentConditions(
            location: any(named: 'location'),
          ),
        );
      },
    );

    test(
      'a failed location resolution recovers after userLocationProvider is '
      'invalidated (the Home retry action), and the retried attempt reaches '
      'the repository with the real, newly-resolved coordinates',
      () async {
        final locationService = SequencedUserLocationService([
          const UserLocationError("Couldn't get your location. Try again."),
          const UserLocationAvailable(
            latitude: -33.9249,
            longitude: 18.4241,
          ),
        ]);

        LocationConditions? captured;
        final mockRepository = MockMarineRepository();
        when(
          () => mockRepository.getCurrentConditions(
            location: any(named: 'location'),
          ),
        ).thenAnswer((invocation) async {
          captured =
              invocation.namedArguments[#location] as LocationConditions;
          throw Exception('stub: not returning real marine data');
        });

        final container = ProviderContainer(
          overrides: [
            userLocationServiceProvider.overrideWithValue(locationService),
            marineRepositoryProvider.overrideWithValue(mockRepository),
          ],
        );
        addTearDown(container.dispose);

        // First attempt: location fails, so marineConditionsProvider must
        // fail too, without ever reaching the repository.
        await expectLater(
          () => container.read(marineConditionsProvider.future),
          throwsException,
        );
        verifyNever(
          () => mockRepository.getCurrentConditions(
            location: any(named: 'location'),
          ),
        );

        // The retry action (see HomeDashboard's error state) invalidates
        // userLocationProvider — this is the exact call under test.
        container.invalidate(userLocationProvider);

        // The retried location resolution now succeeds, so
        // marineConditionsProvider must naturally recover and reach the
        // repository with the real, newly-resolved coordinates — never a
        // Durban/default fallback.
        await expectLater(
          () => container.read(marineConditionsProvider.future),
          throwsException, // still the repository stub's own thrown error
        );

        expect(captured, isNotNull);
        expect(captured!.latitude, -33.9249);
        expect(captured!.longitude, 18.4241);
        expect(captured!.latitude, isNot(-29.8587));
        expect(captured!.longitude, isNot(31.0218));
      },
    );
  });
}
