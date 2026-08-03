// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: location_conditions_mapper.dart
//
// Purpose:
// Creates Neptune's canonical LocationConditions.
//
// -----------------------------------------------------------------------------

import '../../domain/value_objects/location_conditions.dart';

class LocationConditionsMapper {
  const LocationConditionsMapper._();

  static LocationConditions toDomain({
    required double latitude,
    required double longitude,
  }) {
    return LocationConditions(
      country: 'South Africa',
      province: 'KwaZulu-Natal',
      region: 'Durban',
      beach: 'Durban',
      latitude: latitude,
      longitude: longitude,
    );
  }
}