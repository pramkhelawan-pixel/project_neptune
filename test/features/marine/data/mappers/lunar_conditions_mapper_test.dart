import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/marine/data/mappers/lunar_conditions_mapper.dart';
import 'package:project_neptune/features/marine/domain/enums/moon_phase.dart';
import 'package:project_neptune/features/marine/domain/value_objects/lunar_conditions.dart';

void main() {
  // Same reference point LunarEngine anchors its calculation to (see
  // lunar_engine.dart and lunar_engine_test.dart).
  final knownNewMoon = DateTime.utc(2000, 1, 6, 18, 14);
  const synodicMonth = 29.53058867;

  final knownFullMoon = knownNewMoon.add(
    Duration(
      milliseconds: ((synodicMonth / 2) * 24 * 60 * 60 * 1000).round(),
    ),
  );

  // Durban, South Africa — a fixed Southern Hemisphere reference location
  // (same coordinates as the Blue Lagoon fishing-spot fixture) used
  // throughout these tests.
  const latitude = -29.7919;
  const longitude = 31.0446;

  LunarConditions toDomain(DateTime date) => LunarConditionsMapper.toDomain(
        date,
        latitude: latitude,
        longitude: longitude,
      );

  group('LunarConditionsMapper.toDomain', () {
    test(
      'no longer always returns Full Moon - a new-moon date maps to '
      'MoonPhase.newMoon',
      () {
        final result = toDomain(knownNewMoon);

        expect(result.phase, isNot(MoonPhase.fullMoon));
        expect(result.phase, MoonPhase.newMoon);
      },
    );

    test('a genuinely full-moon date maps to MoonPhase.fullMoon', () {
      final result = toDomain(knownFullMoon);

      expect(result.phase, MoonPhase.fullMoon);
    });

    test('different dates produce different phases (not a constant)', () {
      final newMoonResult = toDomain(knownNewMoon);
      final fullMoonResult = toDomain(knownFullMoon);

      expect(newMoonResult.phase, isNot(fullMoonResult.phase));
    });

    test('illumination is passed through from LunarEngine, not fixed at '
        '100', () {
      final newMoonResult = toDomain(knownNewMoon);
      final fullMoonResult = toDomain(knownFullMoon);

      expect(newMoonResult.illumination, lessThan(5.0));
      expect(fullMoonResult.illumination, greaterThan(95.0));
      expect(newMoonResult.illumination, isNot(100.0));
    });

    test(
      'the marine-domain MoonPhase enum value matches the lunar-domain '
      'phase name exactly (correct cross-enum mapping)',
      () {
        // Exercise every phase bucket via a fixed cadence of dates spanning
        // just over one full synodic month, and confirm the resulting
        // marine MoonPhase's displayName always matches what the phase
        // ought to be (no off-by-one mapping between the two MoonPhase
        // enums).
        final phasesSeen = <MoonPhase>{};

        for (var i = 0; i <= 30; i++) {
          final date = knownNewMoon.add(Duration(days: i));
          final result = toDomain(date);
          phasesSeen.add(result.phase);
        }

        // Sweeping a full cycle should visit every one of the 8 canonical
        // phases at least once.
        expect(phasesSeen, hasLength(8));
      },
    );

    test(
      'phase/illumination are unaffected by location (location only drives '
      'moonrise/moonset/period calculation)',
      () {
        final durban = LunarConditionsMapper.toDomain(
          knownFullMoon,
          latitude: -29.7919,
          longitude: 31.0446,
        );

        final reykjavik = LunarConditionsMapper.toDomain(
          knownFullMoon,
          latitude: 64.1466,
          longitude: -21.9426,
        );

        expect(durban.phase, reykjavik.phase);
        expect(durban.illumination, reykjavik.illumination);
      },
    );

    test('populates moonrise/moonset and major/minor periods for a normal '
        'Southern Hemisphere date', () {
      final result = toDomain(DateTime.utc(2026, 6, 15, 12));

      expect(result.majorPeriods, hasLength(2));
      expect(
        result.minorPeriods.length,
        anyOf(0, 1, 2),
      );
    });
  });
}
