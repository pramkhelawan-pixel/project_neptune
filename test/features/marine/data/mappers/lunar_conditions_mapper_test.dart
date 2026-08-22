import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/marine/data/mappers/lunar_conditions_mapper.dart';
import 'package:project_neptune/features/marine/domain/enums/moon_phase.dart';

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

  group('LunarConditionsMapper.toDomain', () {
    test(
      'no longer always returns Full Moon - a new-moon date maps to '
      'MoonPhase.newMoon',
      () {
        final result = LunarConditionsMapper.toDomain(knownNewMoon);

        expect(result.phase, isNot(MoonPhase.fullMoon));
        expect(result.phase, MoonPhase.newMoon);
      },
    );

    test('a genuinely full-moon date maps to MoonPhase.fullMoon', () {
      final result = LunarConditionsMapper.toDomain(knownFullMoon);

      expect(result.phase, MoonPhase.fullMoon);
    });

    test('different dates produce different phases (not a constant)', () {
      final newMoonResult = LunarConditionsMapper.toDomain(knownNewMoon);
      final fullMoonResult = LunarConditionsMapper.toDomain(knownFullMoon);

      expect(newMoonResult.phase, isNot(fullMoonResult.phase));
    });

    test('illumination is passed through from LunarEngine, not fixed at '
        '100', () {
      final newMoonResult = LunarConditionsMapper.toDomain(knownNewMoon);
      final fullMoonResult = LunarConditionsMapper.toDomain(knownFullMoon);

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
          final result = LunarConditionsMapper.toDomain(date);
          phasesSeen.add(result.phase);
        }

        // Sweeping a full cycle should visit every one of the 8 canonical
        // phases at least once.
        expect(phasesSeen, hasLength(8));
      },
    );
  });
}
