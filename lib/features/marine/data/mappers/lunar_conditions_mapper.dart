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
import '../../../lunar/domain/solunar_engine.dart';

import '../../domain/enums/moon_phase.dart';
import '../../domain/value_objects/lunar_conditions.dart';

class LunarConditionsMapper {
  const LunarConditionsMapper._();

  static const _lunarEngine = LunarEngine();
  static const _solunarEngine = SolunarEngine();

  /// [latitude] and [longitude] drive moonrise/moonset/major/minor-period
  /// calculation only — [LunarEngine]'s phase/illumination calculation
  /// remains location-independent, as it astronomically should be.
  static LunarConditions toDomain(
    DateTime date, {
    required double latitude,
    required double longitude,
  }) {
    final lunarData = _lunarEngine.calculate(date);

    final solunarData = _solunarEngine.calculate(
      date,
      latitude: latitude,
      longitude: longitude,
    );

    return LunarConditions(
      phase: _toMarineDomain(lunarData.phase),
      illumination: lunarData.illumination,
      moonrise: solunarData.moonrise,
      moonset: solunarData.moonset,
      majorPeriods: solunarData.majorPeriods,
      minorPeriods: solunarData.minorPeriods,
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