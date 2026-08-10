import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/marine/domain/models/marine_conditions.dart';
import 'package:project_neptune/features/species/domain/species_engine.dart';

void main() {
  const engine = SpeciesEngine();

  final conditions = MarineConditions(
    windSpeed: 15,
    windDirection: 'SW',
    swellHeight: 1.2,
    swellPeriod: 8,
    waterTemperature: 19,
    airTemperature: 22,
    atmosphericPressure: 1015,
    tideHeight: 1.4,
    tideState: 'Incoming',
    nextHighTide: DateTime(2026, 1, 1, 6),
    nextLowTide: DateTime(2026, 1, 1, 12),
    moonPhase: 'Full Moon',
    sunrise: DateTime(2026, 1, 1, 5, 30),
    sunset: DateTime(2026, 1, 1, 19, 30),
  );

  bool containsSpecies(List<String> names, String name) {
    return names.contains(name);
  }

  group('rank - regulatory exclusion', () {
    test('excludes shad on a date inside its closed season', () {
      final names = engine
          .rank(conditions, now: DateTime(2026, 10, 15))
          .map((r) => r.species.name)
          .toList();

      expect(containsSpecies(names, 'Shad'), isFalse);
    });

    test('includes shad on a date outside its closed season', () {
      final names = engine
          .rank(conditions, now: DateTime(2026, 12, 1))
          .map((r) => r.species.name)
          .toList();

      expect(containsSpecies(names, 'Shad'), isTrue);
    });

    test('excludes galjoen on a date inside its closed season', () {
      final names = engine
          .rank(conditions, now: DateTime(2026, 11, 1))
          .map((r) => r.species.name)
          .toList();

      expect(containsSpecies(names, 'Galjoen'), isFalse);
    });

    test(
      'excludes galjoen on the year-boundary closed-season date (15 Jan)',
      () {
        final names = engine
            .rank(conditions, now: DateTime(2027, 1, 15))
            .map((r) => r.species.name)
            .toList();

        expect(containsSpecies(names, 'Galjoen'), isFalse);
      },
    );

    test('includes galjoen on a date outside its closed season', () {
      final names = engine
          .rank(conditions, now: DateTime(2027, 6, 15))
          .map((r) => r.species.name)
          .toList();

      expect(containsSpecies(names, 'Galjoen'), isTrue);
    });

    test(
      'an unrelated species (Dusky Kob) is unaffected on shad/galjoen closed dates',
      () {
        final onShadClosedDate = engine
            .rank(conditions, now: DateTime(2026, 10, 15))
            .map((r) => r.species.name)
            .toList();
        final onGaljoenClosedDate = engine
            .rank(conditions, now: DateTime(2027, 1, 15))
            .map((r) => r.species.name)
            .toList();

        expect(containsSpecies(onShadClosedDate, 'Dusky Kob'), isTrue);
        expect(containsSpecies(onGaljoenClosedDate, 'Dusky Kob'), isTrue);
      },
    );

    test('recommend() still returns a result when both shad and galjoen '
        'are simultaneously excluded (their closed seasons overlap '
        '15 Oct - 30 Nov)', () {
      final recommendation = engine.recommend(
        conditions,
        now: DateTime(2026, 10, 20),
      );

      expect(recommendation.species.name, isNot('Shad'));
      expect(recommendation.species.name, isNot('Galjoen'));
    });
  });

  group('rank - defaults', () {
    test('recommend() without an explicit `now` does not throw', () {
      expect(() => engine.recommend(conditions), returnsNormally);
    });
  });
}
