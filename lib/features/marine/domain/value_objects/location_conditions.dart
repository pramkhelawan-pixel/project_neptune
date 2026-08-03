// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: location_conditions.dart
//
// Purpose:
// Immutable value object representing the geographic location associated with
// a marine observation.
//
// LocationConditions forms part of Neptune's canonical Marine Domain and is
// consumed throughout the platform wherever environmental observations are
// location-specific.
//
// -----------------------------------------------------------------------------

class LocationConditions {
  /// Country.
  final String country;

  /// Province or state.
  final String province;

  /// Coastal region.
  final String region;

  /// Beach or fishing location.
  final String beach;

  /// Latitude in decimal degrees.
  final double latitude;

  /// Longitude in decimal degrees.
  final double longitude;

  const LocationConditions({
    required this.country,
    required this.province,
    required this.region,
    required this.beach,
    required this.latitude,
    required this.longitude,
  });

  /// Returns the location as a human-readable string.
  String get displayName =>
      '$beach, $region, $province, $country';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationConditions &&
        other.country == country &&
        other.province == province &&
        other.region == region &&
        other.beach == beach &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => Object.hash(
    country,
    province,
    region,
    beach,
    latitude,
    longitude,
  );

  @override
  String toString() {
    return 'LocationConditions('
        'country: $country, '
        'province: $province, '
        'region: $region, '
        'beach: $beach, '
        'latitude: $latitude, '
        'longitude: $longitude'
        ')';
  }
}