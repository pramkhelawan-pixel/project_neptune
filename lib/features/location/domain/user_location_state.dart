/// Explicit outcome of resolving the device's current GPS location.
///
/// Deliberately never collapses "we don't know" into a fabricated success —
/// every failure mode (permission denied, location services off, or any
/// other error) is its own distinct state so callers can react honestly
/// instead of silently substituting a default location.
///
/// "Loading" is not a variant here — [userLocationProvider] exposes this
/// wrapped in Riverpod's own `AsyncValue`, whose `AsyncLoading` already
/// represents an in-progress fetch. This type only needs to describe the
/// possible *resolved* outcomes.
sealed class UserLocationState {
  const UserLocationState();
}

/// A real GPS fix was obtained.
class UserLocationAvailable extends UserLocationState {
  final double latitude;
  final double longitude;

  const UserLocationAvailable({
    required this.latitude,
    required this.longitude,
  });
}

/// The user has denied (or permanently denied) location permission.
class UserLocationPermissionDenied extends UserLocationState {
  const UserLocationPermissionDenied();
}

/// Location services are disabled at the device level.
class UserLocationUnavailable extends UserLocationState {
  final String message;

  const UserLocationUnavailable(this.message);
}

/// Any other failure (timeout, platform exception, etc.).
class UserLocationError extends UserLocationState {
  final String message;

  const UserLocationError(this.message);
}
