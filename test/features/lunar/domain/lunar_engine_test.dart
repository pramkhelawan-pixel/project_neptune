import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/lunar/domain/lunar_engine.dart';
import 'package:project_neptune/features/lunar/domain/moon_phase.dart';

void main() {
  // LunarEngine's own known reference point (see lunar_engine.dart): the
  // synodic-month calculation is anchored to this exact new moon. Tests are
  // written against this self-declared reference, not an externally
  // "verified" historical date, since the engine's algorithm is what's
  // under test here, not real-world astronomical almanac data.
  final knownNewMoon = DateTime.utc(2000, 1, 6, 18, 14);
  const synodicMonth = 29.53058867;

  group('LunarEngine.calculate', () {
    const engine = LunarEngine();

    test('at the known reference new moon, phase is New Moon with near-zero '
        'illumination', () {
      final result = engine.calculate(knownNewMoon);

      expect(result.phase, MoonPhase.newMoon);
      expect(result.illumination, lessThan(5.0));
    });

    test('half a synodic month later, phase is Full Moon with near-100% '
        'illumination', () {
      final halfway = knownNewMoon.add(
        Duration(
          milliseconds: ((synodicMonth / 2) * 24 * 60 * 60 * 1000).round(),
        ),
      );

      final result = engine.calculate(halfway);

      expect(result.phase, MoonPhase.fullMoon);
      expect(result.illumination, greaterThan(95.0));
    });

    test('a full synodic month later, the phase cycles back to New Moon',
        () {
      final oneCycleLater = knownNewMoon.add(
        Duration(
          milliseconds: (synodicMonth * 24 * 60 * 60 * 1000).round(),
        ),
      );

      final result = engine.calculate(oneCycleLater);

      expect(result.phase, MoonPhase.newMoon);
    });

    test('lunarAge always stays within one synodic month', () {
      final result = engine.calculate(DateTime.utc(2026, 6, 15));

      expect(result.lunarAge, greaterThanOrEqualTo(0));
      expect(result.lunarAge, lessThan(synodicMonth));
    });

    test('a local (non-UTC) DateTime is handled the same as its UTC '
        'equivalent', () {
      final utcResult = engine.calculate(knownNewMoon);
      final localEquivalent = knownNewMoon.toLocal();
      final localResult = engine.calculate(localEquivalent);

      expect(localResult.phase, utcResult.phase);
      expect(
        localResult.lunarAge,
        closeTo(utcResult.lunarAge, 0.01),
      );
    });
  });
}
