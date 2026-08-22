/// Thrown when a real device location is required (e.g. to fetch marine
/// conditions for the user's actual position) but could not be obtained.
///
/// Carries the same honest, specific message as the corresponding
/// [UserLocationState] failure variant rather than a generic message, so it
/// is safe to surface directly in error UI.
class LocationUnavailableException implements Exception {
  final String message;

  const LocationUnavailableException(this.message);

  @override
  String toString() => message;
}
