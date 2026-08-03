// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: marine_conditions.dart
//
// Purpose:
// Canonical root entity representing the complete set of marine and
// environmental observations used throughout Neptune.
//
// This entity is the authoritative environmental model for the platform.
//
// Owned by:
// • Marine Feature
//
// Consumed by:
// • Intelligence Engine
// • Recommendation Engine
// • Analytics
// • AI
// • Presentation
//
// -----------------------------------------------------------------------------

import '../value_objects/atmospheric_conditions.dart';
import '../value_objects/current_conditions.dart';
import '../value_objects/location_conditions.dart';
import '../value_objects/lunar_conditions.dart';
import '../value_objects/observation_metadata.dart';
import '../value_objects/solar_conditions.dart';
import '../value_objects/swell_conditions.dart';
import '../value_objects/tide_conditions.dart';
import '../value_objects/water_conditions.dart';
import '../value_objects/wind_conditions.dart';

class MarineConditions {
  /// Wind observations.
  final WindConditions wind;

  /// Tide observations.
  final TideConditions tide;

  /// Swell observations.
  final SwellConditions swell;

  /// Ocean current observations.
  final CurrentConditions current;

  /// Water observations.
  final WaterConditions water;

  /// Atmospheric observations.
  final AtmosphericConditions atmosphere;

  /// Lunar observations.
  final LunarConditions moon;

  /// Solar observations.
  final SolarConditions sun;

  /// Geographic location.
  final LocationConditions location;

  /// Observation metadata.
  final ObservationMetadata metadata;

  const MarineConditions({
    required this.wind,
    required this.tide,
    required this.swell,
    required this.current,
    required this.water,
    required this.atmosphere,
    required this.moon,
    required this.sun,
    required this.location,
    required this.metadata,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MarineConditions &&
        other.wind == wind &&
        other.tide == tide &&
        other.swell == swell &&
        other.current == current &&
        other.water == water &&
        other.atmosphere == atmosphere &&
        other.moon == moon &&
        other.sun == sun &&
        other.location == location &&
        other.metadata == metadata;
  }

  @override
  int get hashCode => Object.hash(
    wind,
    tide,
    swell,
    current,
    water,
    atmosphere,
    moon,
    sun,
    location,
    metadata,
  );

  @override
  String toString() {
    return 'MarineConditions('
        'location: ${location.displayName}, '
        'wind: ${wind.speed} km/h ${wind.direction}, '
        'tide: ${tide.state}, '
        'swell: ${swell.height.toStringAsFixed(1)} m'
        ')';
  }
}