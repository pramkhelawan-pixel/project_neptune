import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../fishing_spots/domain/entities/fishing_spot.dart';
import '../../../fishing_spots/presentation/providers/fishing_spot_repository_provider.dart';
import '../../../location/data/all_locations.dart';
import '../../../location/domain/user_location_state.dart';
import '../../../location/presentation/providers/user_location_provider.dart';

/// Builds one marker per fishing spot. Extracted from [MapsPage.build] so
/// the coordinate → marker conversion can be tested directly without
/// standing up a full `FlutterMap` widget tree (which would otherwise pull
/// in real tile-network requests during tests).
@visibleForTesting
List<Marker> buildFishingSpotMarkers(
  List<FishingSpot> spots, {
  required void Function(FishingSpot spot) onTap,
}) {
  return [
    for (final spot in spots)
      Marker(
        point: LatLng(spot.latitude, spot.longitude),
        width: 44,
        height: 44,
        child: GestureDetector(
          onTap: () => onTap(spot),
          child: const Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40,
          ),
        ),
      ),
  ];
}

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

  void _showFishingSpotDetails(FishingSpot spot) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _FishingSpotDetailsSheet(spot: spot),
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

    // Loading and error both resolve to an empty spot list here rather than
    // surfacing a full-screen state: the map (tiles + GPS) stays fully
    // usable either way, and no fake/placeholder spots are ever shown in
    // their place.
    final fishingSpots =
        ref.watch(fishingSpotsProvider).valueOrNull ?? const <FishingSpot>[];

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
                ...buildFishingSpotMarkers(
                  fishingSpots,
                  onTap: _showFishingSpotDetails,
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

class _FishingSpotDetailsSheet extends StatelessWidget {
  final FishingSpot spot;

  const _FishingSpotDetailsSheet({required this.spot});

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
              spot.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              '${spot.region}, ${spot.province}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 12),

            Text(spot.spotType),

            if (spot.accessNotes != null) ...[
              const SizedBox(height: 8),
              Text(spot.accessNotes!),
            ],

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (spot.isMpa)
                  Chip(
                    label: Text(spot.mpaName ?? 'Marine Protected Area'),
                  ),
                if (spot.isNoTake)
                  Chip(
                    label: const Text('No-Take Zone'),
                    backgroundColor: Colors.red.shade100,
                  ),
                for (final flag in spot.safetyFlags)
                  Chip(
                    label: Text(flag),
                    backgroundColor: Colors.orange.shade100,
                  ),
              ],
            ),

            if (spot.targetSpecies.isNotEmpty) ...[
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
                  for (final species in spot.targetSpecies)
                    Chip(label: Text(species)),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
