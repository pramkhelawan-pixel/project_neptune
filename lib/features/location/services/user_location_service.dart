import 'package:geolocator/geolocator.dart';

import '../domain/user_location_state.dart';

/// Resolves the device's current GPS location.
///
/// An interface (rather than a single concrete class) so tests can supply a
/// fake implementation without depending on the real `geolocator` platform
/// channel.
abstract class UserLocationService {
  Future<UserLocationState> getCurrentLocation();
}

/// Real implementation backed by `package:geolocator`.
///
/// This is the exact permission/fetch flow previously embedded directly in
/// `MapsPage`, extracted so it can be shared by any provider that needs the
/// user's real location — not just the Maps screen.
class GeolocatorUserLocationService implements UserLocationService {
  const GeolocatorUserLocationService();

  @override
  Future<UserLocationState> getCurrentLocation() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        return const UserLocationUnavailable(
          'Enable location services to use this.',
        );
      }

      var permission = await Geolocator.checkPermission().timeout(
        const Duration(seconds: 10),
      );

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission().timeout(
          const Duration(seconds: 30),
        );
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return const UserLocationPermissionDenied();
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          timeLimit: Duration(seconds: 10),
        ),
      );

      return UserLocationAvailable(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (_) {
      // Deliberately no coordinates or exception details in this message —
      // never log precise GPS coordinates, and this exact string is safe to
      // surface directly to the user.
      return const UserLocationError("Couldn't get your location. Try again.");
    }
  }
}
