import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/marine/domain/enums/tide_state.dart';
import 'package:project_neptune/features/marine/domain/models/marine_conditions.dart';
import 'package:project_neptune/features/readiness/domain/readiness_engine.dart';

void main() {
  const engine = ReadinessEngine();

  MarineConditions conditions({
    required double windSpeed,
    required double swellHeight,
    TideState? canonicalTideState,
  }) {
    return MarineConditions(
      windSpeed: windSpeed,
      windDirection: 'SW',
      swellHeight: swellHeight,
      swellPeriod: 8,
      waterTemperature: 20,
      airTemperature: 20,
      atmosphericPressure: 1015,
      tideHeight: 1.0,
      tideState: 'Incoming',
      canonicalTideState: canonicalTideState,
      nextHighTide: null,
      nextLowTide: null,
      moonPhase: 'Full Moon',
      sunrise: DateTime(2026, 1, 1, 5, 30),
      sunset: DateTime(2026, 1, 1, 19, 30),
    );
  }

  group('ReadinessEngine - maximum and minimum reachable score', () {
    test('best possible conditions (light wind, ideal swell, incoming '
        'tide) produce the true maximum score of 100, rated Excellent', () {
      final result = engine.calculate(conditions(
        windSpeed: 5,
        swellHeight: 1.5,
        canonicalTideState: TideState.incoming,
      ));

      expect(result.score, 100);
      expect(result.rating, 'Excellent');
    });

    test('worst possible conditions (strong wind, large swell, unknown '
        'tide) produce the true minimum score of 21, rated Poor', () {
      final result = engine.calculate(conditions(
        windSpeed: 30,
        swellHeight: 4,
        canonicalTideState: null,
      ));

      expect(result.score, 21);
      expect(result.rating, 'Poor');
    });

    test('score never exceeds 100 even at the true maximum input '
        'combination', () {
      final result = engine.calculate(conditions(
        windSpeed: 5,
        swellHeight: 1.5,
        canonicalTideState: TideState.incoming,
      ));

      expect(result.score, lessThanOrEqualTo(100));
    });
  });

  group('ReadinessEngine - Excellent is reachable via more than one '
      'combination (regression guard against a single-path knife-edge)', () {
    test('moderate wind + ideal swell + high tide (22+36+28=86) is '
        'Excellent', () {
      final result = engine.calculate(conditions(
        windSpeed: 15,
        swellHeight: 1.5,
        canonicalTideState: TideState.high,
      ));

      expect(result.score, 86);
      expect(result.rating, 'Excellent');
    });

    test('light wind + fishable swell + incoming tide (29+22+35=86) is '
        'Excellent', () {
      final result = engine.calculate(conditions(
        windSpeed: 5,
        swellHeight: 2.5,
        canonicalTideState: TideState.incoming,
      ));

      expect(result.score, 86);
      expect(result.rating, 'Excellent');
    });
  });

  group('ReadinessEngine - rating boundaries', () {
    test('a mid-range combination lands in Good (70-84)', () {
      // Light wind (29) + ideal swell (36) + outgoing tide (14) = 79.
      final result = engine.calculate(conditions(
        windSpeed: 5,
        swellHeight: 1.5,
        canonicalTideState: TideState.outgoing,
      ));

      expect(result.score, 79);
      expect(result.rating, 'Good');
    });

    test('a lower combination lands in Fair (50-69)', () {
      // Moderate wind (22) + large swell (7) + high tide (28) = 57.
      final result = engine.calculate(conditions(
        windSpeed: 15,
        swellHeight: 4,
        canonicalTideState: TideState.high,
      ));

      expect(result.score, 57);
      expect(result.rating, 'Fair');
    });

    test('a low combination lands in Poor (below 50)', () {
      // Strong wind (7) + large swell (7) + outgoing tide (14) = 28.
      final result = engine.calculate(conditions(
        windSpeed: 30,
        swellHeight: 4,
        canonicalTideState: TideState.outgoing,
      ));

      expect(result.score, 28);
      expect(result.rating, 'Poor');
    });
  });

  group('ReadinessEngine - tide state coverage', () {
    test('outgoing and low tide both score 14 (same tier)', () {
      final outgoing = engine.calculate(conditions(
        windSpeed: 5,
        swellHeight: 1.5,
        canonicalTideState: TideState.outgoing,
      ));
      final low = engine.calculate(conditions(
        windSpeed: 5,
        swellHeight: 1.5,
        canonicalTideState: TideState.low,
      ));

      expect(outgoing.score, low.score);
      expect(outgoing.score, 29 + 36 + 14);
    });
  });

  group('ReadinessEngine - determinism', () {
    test('calling calculate() twice with identical input produces an '
        'identical result', () {
      final input = conditions(
        windSpeed: 12,
        swellHeight: 2,
        canonicalTideState: TideState.high,
      );

      final first = engine.calculate(input);
      final second = engine.calculate(input);

      expect(first.score, second.score);
      expect(first.rating, second.rating);
      expect(first.reasons, second.reasons);
    });
  });

  group('ReadinessEngine - reasons reflect the actual scoring branch', () {
    test('reasons list names the exact wind/swell/tide bands used', () {
      final result = engine.calculate(conditions(
        windSpeed: 5,
        swellHeight: 1.5,
        canonicalTideState: TideState.incoming,
      ));

      expect(result.reasons, containsAll(<String>[
        'Light wind',
        'Ideal swell',
        'Incoming tide',
      ]));
    });
  });
}
