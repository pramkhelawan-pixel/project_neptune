import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../location/data/all_locations.dart';
import '../../../location/domain/location.dart';
import '../../../location/domain/user_location_state.dart';
import '../../../location/presentation/providers/user_location_provider.dart';

class MapsPage extends ConsumerStatefulWidget {
  const MapsPage({super.key});

  @override
  ConsumerState<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends ConsumerState<MapsPage> {
  final MapController _mapController = MapController();

  static final LatLng _defaultCenter = LatLng(
    allLocations.first.latitude,
    allLocations.first.longitude,
  );

  /// Tapping the locate FAB: recenter immediately if we already have a
  /// position, otherwise (re)attempt resolution and react to the outcome.
  /// Mirrors the original per-tap retry behaviour, just sourced from the
  /// shared provider instead of a private GPS fetch.
  Future<void> _onLocateTap() async {
    final current = ref.read(userLocationProvider).valueOrNull;

    if (current is UserLocationAvailable) {
      _mapController.move(
        LatLng(current.latitude, current.longitude),
        13,
      );
      return;
    }

    ref.invalidate(userLocationProvider);

    UserLocationState result;
    try {
      result = await ref.read(userLocationProvider.future);
    } catch (_) {
      if (mounted) {
        _showMessage("Couldn't get your location. Try again.");
      }
      return;
    }

    if (!mounted) {
      return;
    }

    switch (result) {
      case UserLocationAvailable(:final latitude, :final longitude):
        _mapController.move(LatLng(latitude, longitude), 13);
      case UserLocationPermissionDenied():
        _showMessage('Location permission denied.');
      case UserLocationUnavailable(:final message):
        _showMessage(message);
      case UserLocationError(:final message):
        _showMessage(message);
    }
  }

  void _showMessage(String message) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showLocationDetails(Location location) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _LocationDetailsSheet(location: location),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locationAsync = ref.watch(userLocationProvider);
    final isLoading = locationAsync.isLoading;

    final userPosition = switch (locationAsync.valueOrNull) {
      UserLocationAvailable(:final latitude, :final longitude) =>
        LatLng(latitude, longitude),
      _ => null,
    };

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _defaultCenter,
            initialZoom: 11,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.continuumdataguard.neptune',
            ),
            MarkerLayer(
              markers: [
                for (final location in allLocations)
                  Marker(
                    point: LatLng(location.latitude, location.longitude),
                    width: 44,
                    height: 44,
                    child: GestureDetector(
                      onTap: () => _showLocationDetails(location),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ),
                if (userPosition != null)
                  Marker(
                    point: userPosition,
                    width: 24,
                    height: 24,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            // MainShellPage's IndexedStack keeps every tab mounted at once,
            // so an unset heroTag collides with any other tab's
            // default-tagged FAB (CatchHistoryPage) -- "multiple heroes
            // share the same tag".
            heroTag: 'maps-locate-fab',
            onPressed: isLoading ? null : _onLocateTap,
            child: isLoading
                ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
                : const Icon(Icons.my_location),
          ),
        ),
      ],
    );
  }
}

class _LocationDetailsSheet extends StatelessWidget {
  final Location location;

  const _LocationDetailsSheet({required this.location});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              location.province,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 12),

            Text(location.description),

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (location.riverMouth) const Chip(label: Text('River Mouth')),
                if (location.reef) const Chip(label: Text('Reef')),
                if (location.sandbanks) const Chip(label: Text('Sandbanks')),
                if (location.gullies) const Chip(label: Text('Gullies')),
                Chip(
                  label: Text(
                    location.safeAtNight ? 'Safe at Night' : 'Caution at Night',
                  ),
                  backgroundColor: location.safeAtNight
                      ? Colors.green.shade100
                      : Colors.orange.shade100,
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              'Target Species',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final species in location.targetSpecies)
                  Chip(label: Text(species)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
