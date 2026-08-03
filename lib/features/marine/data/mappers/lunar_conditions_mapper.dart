// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: lunar_conditions_mapper.dart
//
// Purpose:
// Maps astronomical observations into Neptune's canonical LunarConditions.
//
// -----------------------------------------------------------------------------

import '../../domain/enums/moon_phase.dart';
import '../../domain/value_objects/lunar_conditions.dart';

class LunarConditionsMapper {
  const LunarConditionsMapper._();

  static LunarConditions toDomain() {
    // Placeholder until lunar provider integration.
    return const LunarConditions(
      phase: MoonPhase.fullMoon,
      illumination: 100.0,
    );
  }
}