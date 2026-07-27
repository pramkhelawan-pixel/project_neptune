import 'dart:math';

import 'lunar_data.dart';
import 'moon_phase.dart';

class LunarEngine {
  const LunarEngine();

  LunarData calculate(DateTime date) {
    final knownNewMoon = DateTime.utc(
      2000,
      1,
      6,
      18,
      14,
    );

    const synodicMonth = 29.53058867;

    final days =
        date.toUtc().difference(knownNewMoon).inHours / 24.0;

    final lunarAge = days % synodicMonth;

    final illumination =
        (1 - cos((2 * pi * lunarAge) / synodicMonth)) / 2;

    MoonPhase phase;

    if (lunarAge < 1.84566) {
      phase = MoonPhase.newMoon;
    } else if (lunarAge < 5.53699) {
      phase = MoonPhase.waxingCrescent;
    } else if (lunarAge < 9.22831) {
      phase = MoonPhase.firstQuarter;
    } else if (lunarAge < 12.91963) {
      phase = MoonPhase.waxingGibbous;
    } else if (lunarAge < 16.61096) {
      phase = MoonPhase.fullMoon;
    } else if (lunarAge < 20.30228) {
      phase = MoonPhase.waningGibbous;
    } else if (lunarAge < 23.99361) {
      phase = MoonPhase.lastQuarter;
    } else if (lunarAge < 27.68493) {
      phase = MoonPhase.waningCrescent;
    } else {
      phase = MoonPhase.newMoon;
    }

    return LunarData(
      phase: phase,
      illumination: illumination * 100,
      lunarAge: lunarAge,
    );
  }
}