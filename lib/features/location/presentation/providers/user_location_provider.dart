import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/user_location_state.dart';
import '../../services/user_location_service.dart';

final userLocationServiceProvider = Provider<UserLocationService>(
  (ref) => const GeolocatorUserLocationService(),
);

/// The single, app-wide source of truth for the device's current GPS
/// location. Every feature that needs the user's real position (Maps,
/// marine conditions, recommendations) watches this instead of acquiring
/// its own GPS fix independently.
///
/// A [FutureProvider] rather than a hand-rolled state machine: this lets
/// dependants use Riverpod's own `ref.watch(userLocationProvider.future)`
/// to await resolution, and `AsyncValue.isLoading` already gives the
/// "loading" state — [UserLocationService.getCurrentLocation] never throws
/// (it catches every failure and returns the matching [UserLocationState]
/// variant instead), so `AsyncData` is the only outcome this should ever
/// produce; `AsyncError` remains available as a safety net, not a
/// designed-for path.
final userLocationProvider = FutureProvider<UserLocationState>((ref) {
  final service = ref.watch(userLocationServiceProvider);
  return service.getCurrentLocation();
});
