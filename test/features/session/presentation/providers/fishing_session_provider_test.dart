import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/location/domain/user_location_state.dart';
import 'package:project_neptune/features/location/presentation/providers/user_location_provider.dart';
import 'package:project_neptune/features/location/services/user_location_service.dart';
import 'package:project_neptune/features/marine/domain/enums/tide_state.dart';
import 'package:project_neptune/features/marine/domain/models/marine_conditions.dart';
import 'package:project_neptune/features/marine/presentation/providers/marine_provider.dart';
import 'package:project_neptune/features/session/presentation/providers/fishing_session_provider.dart';

class FakeUserLocationService implements UserLocationService {
  FakeUserLocationService(this._result);

  final UserLocationState _result;

  @override
  Future<UserLocationState> getCurrentLocation() async => _result;
}

MarineConditions _sampleConditions() {
  return MarineConditions(
    windSpeed: 10,
    windDirection: 'SW',
    swellHeight: 1.0,
    swellPeriod: 8,
    waterTemperature: 20,
    airTemperature: 20,
    atmosphericPressure: 1015,
    tideHeight: 1.0,
    tideState: 'Incoming',
    canonicalTideState: TideState.incoming,
    nextHighTide: DateTime(2026, 1, 1, 6),
    nextLowTide: DateTime(2026, 1, 1, 12),
    moonPhase: 'Full Moon',
    sunrise: DateTime(2026, 1, 1, 5, 30),
    sunset: DateTime(2026, 1, 1, 19, 30),
  );
}

void main() {
  group('fishingSessionProvider - location label', () {
    test(
      'no longer hardcodes "Blue Lagoon" - uses a real coordinate label when '
      'GPS is available',
      () async {
        final container = ProviderContainer(
          overrides: [
            marineConditionsProvider.overrideWith(
              (ref) async => _sampleConditions(),
            ),
            userLocationServiceProvider.overrideWithValue(
              FakeUserLocationService(
                const UserLocationAvailable(
                  latitude: -33.9249,
                  longitude: 18.4241,
                ),
              ),
            ),
          ],
        );
        addTearDown(container.dispose);

        final session = await container.read(fishingSessionProvider.future);

        expect(session.location, isNot('Blue Lagoon'));
        expect(session.location, contains('-33.9249'));
        expect(session.location, contains('18.4241'));
      },
    );

    test('a different GPS fix produces a different location label', () async {
      final container = ProviderContainer(
        overrides: [
          marineConditionsProvider.overrideWith(
            (ref) async => _sampleConditions(),
          ),
          userLocationServiceProvider.overrideWithValue(
            FakeUserLocationService(
              const UserLocationAvailable(
                latitude: -29.8587,
                longitude: 31.0218,
              ),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      final session = await container.read(fishingSessionProvider.future);

      expect(session.location, contains('-29.8587'));
      expect(session.location, contains('31.0218'));
    });
  });
}
