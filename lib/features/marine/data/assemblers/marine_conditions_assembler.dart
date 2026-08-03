// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: marine_conditions_assembler.dart
//
// Purpose:
// Assembles Neptune's canonical MarineConditions aggregate from strongly typed
// value objects.
//
// -----------------------------------------------------------------------------

import '../../domain/entities/marine_conditions.dart';

import '../../domain/value_objects/atmospheric_conditions.dart';
import '../../domain/value_objects/current_conditions.dart';
import '../../domain/value_objects/location_conditions.dart';
import '../../domain/value_objects/lunar_conditions.dart';
import '../../domain/value_objects/observation_metadata.dart';
import '../../domain/value_objects/solar_conditions.dart';
import '../../domain/value_objects/swell_conditions.dart';
import '../../domain/value_objects/tide_conditions.dart';
import '../../domain/value_objects/water_conditions.dart';
import '../../domain/value_objects/wind_conditions.dart';

class MarineConditionsAssembler {
  const MarineConditionsAssembler._();

  static MarineConditions assemble({
    required WindConditions wind,
    required TideConditions tide,
    required SwellConditions swell,
    required CurrentConditions current,
    required WaterConditions water,
    required AtmosphericConditions atmosphere,
    required LunarConditions moon,
    required SolarConditions sun,
    required LocationConditions location,
    required ObservationMetadata metadata,
  }) {
    return MarineConditions(
      wind: wind,
      tide: tide,
      swell: swell,
      current: current,
      water: water,
      atmosphere: atmosphere,
      moon: moon,
      sun: sun,
      location: location,
      metadata: metadata,
    );
  }
}