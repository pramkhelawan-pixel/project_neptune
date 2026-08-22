import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/location/domain/user_location_state.dart';
import 'package:project_neptune/features/location/presentation/providers/user_location_provider.dart';
import 'package:project_neptune/features/location/services/user_location_service.dart';

/// Returns a canned [UserLocationState] instead of touching the real
/// `geolocator` platform channel, so every resolved outcome can be tested
/// without device GPS.
class FakeUserLocationService implements UserLocationService {
  FakeUserLocationService(this._result);

  final UserLocationState _result;
  int callCount = 0;

  @override
  Future<UserLocationState> getCurrentLocation() async {
    callCount++;
    return _result;
  }
}

ProviderContainer _containerFor(UserLocationState result) {
  final container = ProviderContainer(
    overrides: [
      userLocationServiceProvider.overrideWithValue(
        FakeUserLocationService(result),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('userLocationProvider', () {
    test('reports AsyncValue.loading before the service resolves', () {
      final container = _containerFor(
        const UserLocationAvailable(latitude: -33.9, longitude: 18.4),
      );

      // Read synchronously, before the async getCurrentLocation() call has
      // had a chance to complete.
      expect(container.read(userLocationProvider).isLoading, isTrue);
    });

    test('permission granted -> resolves to UserLocationAvailable with the '
        'real coordinates', () async {
      final container = _containerFor(
        const UserLocationAvailable(latitude: -33.9249, longitude: 18.4241),
      );

      final state = await container.read(userLocationProvider.future);

      expect(state, isA<UserLocationAvailable>());
      final available = state as UserLocationAvailable;
      expect(available.latitude, -33.9249);
      expect(available.longitude, 18.4241);
    });

    test('permission denied -> resolves to UserLocationPermissionDenied',
        () async {
      final container = _containerFor(const UserLocationPermissionDenied());

      final state = await container.read(userLocationProvider.future);

      expect(state, isA<UserLocationPermissionDenied>());
    });

    test(
      'location services disabled -> resolves to UserLocationUnavailable',
      () async {
        final container = _containerFor(
          const UserLocationUnavailable(
            'Enable location services to use this.',
          ),
        );

        final state = await container.read(userLocationProvider.future);

        expect(state, isA<UserLocationUnavailable>());
        expect(
          (state as UserLocationUnavailable).message,
          'Enable location services to use this.',
        );
      },
    );

    test('unexpected failure -> resolves to UserLocationError, never a '
        'fabricated location', () async {
      final container = _containerFor(
        const UserLocationError("Couldn't get your location. Try again."),
      );

      final state = await container.read(userLocationProvider.future);

      expect(state, isA<UserLocationError>());
      expect(state, isNot(isA<UserLocationAvailable>()));
    });

    test('invalidating re-invokes the underlying service', () async {
      final service = FakeUserLocationService(
        const UserLocationAvailable(latitude: 1, longitude: 2),
      );
      final container = ProviderContainer(
        overrides: [
          userLocationServiceProvider.overrideWithValue(service),
        ],
      );
      addTearDown(container.dispose);

      await container.read(userLocationProvider.future);
      final countAfterFirstResolve = service.callCount;

      container.invalidate(userLocationProvider);
      await container.read(userLocationProvider.future);

      expect(service.callCount, greaterThan(countAfterFirstResolve));
    });
  });
}
