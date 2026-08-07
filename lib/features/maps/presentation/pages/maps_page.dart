import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../location/data/all_locations.dart';
import '../../../location/domain/location.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final MapController _mapController = MapController();

  LatLng? _userPosition;

  bool _locating = false;

  static final LatLng _defaultCenter = LatLng(
    allLocations.first.latitude,
    allLocations.first.longitude,
  );

  Future<void> _loadUserPosition() async {
    if (_locating) {
      return;
    }

    setState(() => _locating = true);

    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        _showMessage('Enable location services to use this.');
        return;
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
        _showMessage('Location permission denied.');
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          timeLimit: Duration(seconds: 10),
        ),
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _userPosition = LatLng(position.latitude, position.longitude);
      });

      _mapController.move(_userPosition!, 13);
    } catch (_) {
      _showMessage("Couldn't get your location. Try again.");
    } finally {
      if (mounted) {
        setState(() => _locating = false);
      }
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
                if (_userPosition != null)
                  Marker(
                    point: _userPosition!,
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
            onPressed: _locating
                ? null
                : () => _userPosition != null
                ? _mapController.move(_userPosition!, 13)
                : _loadUserPosition(),
            child: _locating
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
