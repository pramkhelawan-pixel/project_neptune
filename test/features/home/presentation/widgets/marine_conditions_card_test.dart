import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/home/presentation/widgets/marine_conditions_card.dart';
import 'package:project_neptune/features/marine/domain/models/marine_conditions.dart';

MarineConditions _conditions({DateTime? observedAt}) {
  return MarineConditions(
    windSpeed: 10,
    windDirection: 'SW',
    swellHeight: 1.2,
    swellPeriod: 7.0,
    waterTemperature: 16.0,
    airTemperature: 22.0,
    atmosphericPressure: 1015,
    tideHeight: 1.1,
    tideState: 'Incoming',
    nextHighTide: DateTime(2026, 1, 1, 18),
    nextLowTide: DateTime(2026, 1, 1, 6),
    moonPhase: 'Full Moon',
    sunrise: DateTime(2026, 1, 1, 5, 30),
    sunset: DateTime(2026, 1, 1, 19, 30),
    observedAt: observedAt,
  );
}

void main() {
  group('MarineConditionsCard - freshness indicator', () {
    testWidgets('a recent observation shows "Last updated" phrasing', (
      tester,
    ) async {
      final conditions = _conditions(
        observedAt: DateTime.now().subtract(const Duration(minutes: 2)),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: MarineConditionsCard(conditions: conditions),
            ),
          ),
        ),
      );

      expect(find.textContaining('Last updated'), findsOneWidget);
      expect(find.textContaining('last known conditions'), findsNothing);
    });

    testWidgets(
      'a stale observation shows the "last known conditions" phrasing with '
      'an age, distinct from the fresh phrasing',
      (tester) async {
        final conditions = _conditions(
          observedAt: DateTime.now().subtract(const Duration(hours: 7)),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: MarineConditionsCard(conditions: conditions),
              ),
            ),
          ),
        );

        expect(
          find.textContaining('Using last known conditions'),
          findsOneWidget,
        );
        expect(find.textContaining('old'), findsOneWidget);
        expect(find.textContaining('Last updated'), findsNothing);
      },
    );

    testWidgets(
      'an unknown observation time shows the last-known-conditions '
      'phrasing without fabricating an age',
      (tester) async {
        final conditions = _conditions();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: MarineConditionsCard(conditions: conditions),
              ),
            ),
          ),
        );

        expect(
          find.text('Using last known conditions'),
          findsOneWidget,
        );
      },
    );
  });
}
