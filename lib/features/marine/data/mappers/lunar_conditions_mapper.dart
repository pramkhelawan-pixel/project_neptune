// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: lunar_conditions_mapper.dart
//
// Purpose:
// Maps astronomical observations into Neptune's canonical LunarConditions.
//
// -----------------------------------------------------------------------------

import '../../../lunar/domain/lunar_engine.dart';
import '../../../lunar/domain/moon_phase.dart' as lunar;

import '../../domain/enums/moon_phase.dart';
import '../../domain/value_objects/lunar_conditions.dart';

class LunarConditionsMapper {
  const LunarConditionsMapper._();

  static const _lunarEngine = LunarEngine();

  static LunarConditions toDomain(DateTime date) {
    final lunarData = _lunarEngine.calculate(date);

    return LunarConditions(
      phase: _toMarineDomain(lunarData.phase),
      illumination: lunarData.illumination,
    );
  }

  /// [LunarEngine] returns `lunar.MoonPhase` (features/lunar) — a distinct
  /// type from this file's `MoonPhase` (features/marine/domain/enums),
  /// despite sharing a name and the same eight phase values. This maps
  /// between them explicitly rather than relying on any implicit
  /// compatibility, since none exists.
  static MoonPhase _toMarineDomain(lunar.MoonPhase phase) {
    switch (phase) {
      case lunar.MoonPhase.newMoon:
        return MoonPhase.newMoon;
      case lunar.MoonPhase.waxingCrescent:
        return MoonPhase.waxingCrescent;
      case lunar.MoonPhase.firstQuarter:
        return MoonPhase.firstQuarter;
      case lunar.MoonPhase.waxingGibbous:
        return MoonPhase.waxingGibbous;
      case lunar.MoonPhase.fullMoon:
        return MoonPhase.fullMoon;
      case lunar.MoonPhase.waningGibbous:
        return MoonPhase.waningGibbous;
      case lunar.MoonPhase.lastQuarter:
        return MoonPhase.lastQuarter;
      case lunar.MoonPhase.waningCrescent:
        return MoonPhase.waningCrescent;
    }
  }
}