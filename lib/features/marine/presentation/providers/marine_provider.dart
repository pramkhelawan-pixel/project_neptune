import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../location/domain/location_unavailable_exception.dart';
import '../../../location/domain/user_location_state.dart';
import '../../../location/presentation/providers/user_location_provider.dart';

import '../../data/mappers/marine_conditions_legacy_mapper.dart';
import '../../data/repositories/marine_repository_impl.dart';

import '../../domain/models/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';
import '../../domain/value_objects/location_conditions.dart';

final marineRepositoryProvider = Provider<MarineRepository>(
      (ref) => MarineRepositoryImpl(),
);

/// Cheap to refresh this often now that repeat calls are served from the
/// get-tides Edge Function's warm Postgres cache, not WorldTides directly.
const _refreshInterval = Duration(minutes: 30);

/// Resolves the device's real GPS location into a [LocationConditions].
/// Throws [LocationUnavailableException] for every non-success outcome —
/// this must never silently fall back to a fixed location.
///
/// `ref.watch(userLocationProvider.future)` is Riverpod's own mechanism for
/// awaiting another async provider's result: it naturally keeps this
/// provider in `AsyncValue.loading` for as long as location is unresolved,
/// and correctly re-runs this builder if [userLocationProvider] is later
/// invalidated and resolves to something new.
Future<LocationConditions> _resolveUserLocation(Ref ref) async {
  final state = await ref.watch(userLocationProvider.future);

  return switch (state) {
    UserLocationAvailable(:final latitude, :final longitude) =>
      LocationConditions(
        // No reverse geocoding is available in this app, so this is a
        // deliberately honest placeholder rather than an invented place
        // name — see LocationConditionsMapper for the same choice on the
        // canonical marine entity.
        country: '',
        province: '',
        region: '',
        beach: 'Current Location',
        latitude: latitude,
        longitude: longitude,
      ),
    UserLocationPermissionDenied() => throw const LocationUnavailableException(
        'Location permission denied. Enable location access to see marine '
        "conditions for your area.",
      ),
    UserLocationUnavailable(:final message) =>
      throw LocationUnavailableException(message),
    UserLocationError(:final message) =>
      throw LocationUnavailableException(message),
  };
}

final marineConditionsProvider =
FutureProvider<MarineConditions>((ref) async {
  final timer = Timer.periodic(_refreshInterval, (_) {
    ref.invalidateSelf();
  });
  ref.onDispose(timer.cancel);

  final location = await _resolveUserLocation(ref);

  final repository = ref.watch(marineRepositoryProvider);

  final entity = await repository.getCurrentConditions(
    location: location,
  );

  return MarineConditionsLegacyMapper.toLegacy(entity);
});