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
    // No reverse geocoding is available in this app, so this deliberately
    // never labels a real GPS position with a fixed place name (e.g.
    // "Durban") that would be false for any other location.
    return LocationConditions(
      country: '',
      province: '',
      region: '',
      beach: 'Current Location',
      latitude: latitude,
      longitude: longitude,
    );
  }
}