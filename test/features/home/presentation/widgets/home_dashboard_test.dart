import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/home/presentation/widgets/home_dashboard.dart';
import 'package:project_neptune/features/location/domain/user_location_state.dart';
import 'package:project_neptune/features/location/presentation/providers/user_location_provider.dart';
import 'package:project_neptune/features/location/services/user_location_service.dart';

/// Always fails (models a denied/timed-out/unavailable GPS resolution),
/// and records how many times a real resolution attempt was made.
class RecordingUserLocationService implements UserLocationService {
  int callCount = 0;

  @override
  Future<UserLocationState> getCurrentLocation() async {
    callCount++;
    return const UserLocationError("Couldn't get your location. Try again.");
  }
}

void main() {
  testWidgets(
    'Marine Conditions error state shows a retry action, and tapping it '
    'invalidates userLocationProvider to attempt a fresh location '
    'resolution',
    (tester) async {
      final locationService = RecordingUserLocationService();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            userLocationServiceProvider.overrideWithValue(locationService),
          ],
          child: const MaterialApp(
            home: Scaffold(body: HomeDashboard()),
          ),
        ),
      );

      // Let the initial (failing) location + marine conditions futures
      // resolve.
      await tester.pump();
      await tester.pump();

      expect(
        find.textContaining('Unable to load marine conditions'),
        findsOneWidget,
      );
      final retryButton = find.widgetWithText(ElevatedButton, 'Try Again');
      expect(retryButton, findsOneWidget);
      expect(locationService.callCount, 1);

      await tester.tap(retryButton);
      await tester.pump();
      await tester.pump();

      // Tapping retry must invalidate userLocationProvider, causing a
      // genuinely fresh location-resolution attempt - not a no-op, and
      // never a silent fallback to a fixed location.
      expect(locationService.callCount, greaterThan(1));

      // The screen is still honestly reporting failure (the fake service
      // always fails) rather than fabricating success.
      expect(
        find.textContaining('Unable to load marine conditions'),
        findsOneWidget,
      );
    },
  );
}
