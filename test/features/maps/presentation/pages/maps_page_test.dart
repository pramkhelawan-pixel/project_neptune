import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:project_neptune/features/fishing_spots/domain/entities/fishing_spot.dart';
import 'package:project_neptune/features/fishing_spots/domain/repositories/fishing_spot_repository.dart';
import 'package:project_neptune/features/fishing_spots/presentation/providers/fishing_spot_repository_provider.dart';
import 'package:project_neptune/features/maps/presentation/pages/maps_page.dart';

class MockFishingSpotRepository extends Mock implements FishingSpotRepository {}

FishingSpot _spot({
  required String id,
  required String name,
  required double latitude,
  required double longitude,
}) {
  return FishingSpot(
    id: id,
    province: 'KwaZulu-Natal',
    region: 'Durban',
    name: name,
    latitude: latitude,
    longitude: longitude,
    spotType: 'Beach',
    targetSpecies: const ['Shad'],
    isMpa: false,
    isNoTake: false,
    safetyFlags: const [],
    createdAt: DateTime(2026, 1, 1),
  );
}

void main() {
  group('buildFishingSpotMarkers', () {
    test('an empty spot list produces an empty, non-crashing marker list',
        () {
      final markers = buildFishingSpotMarkers(
        const [],
        onTap: (_) {},
      );

      expect(markers, isEmpty);
    });

    test('a single spot converts to a marker at its exact coordinates', () {
      final spot = _spot(
        id: 'SPOT-1',
        name: 'Blue Lagoon',
        latitude: -29.7919,
        longitude: 31.0446,
      );

      final markers = buildFishingSpotMarkers(
        [spot],
        onTap: (_) {},
      );

      expect(markers, hasLength(1));
      expect(markers.first.point.latitude, -29.7919);
      expect(markers.first.point.longitude, 31.0446);
    });

    test('multiple spots each produce their own marker at their own '
        'coordinates', () {
      final spots = [
        _spot(id: 'SPOT-1', name: 'Blue Lagoon', latitude: -29.79, longitude: 31.04),
        _spot(id: 'SPOT-2', name: 'Umkomaas', latitude: -30.20, longitude: 30.79),
        _spot(id: 'SPOT-3', name: 'Cape Point', latitude: -34.34, longitude: 18.48),
      ];

      final markers = buildFishingSpotMarkers(
        spots,
        onTap: (_) {},
      );

      expect(markers, hasLength(3));
      expect(
        markers.map((m) => m.point.latitude),
        containsAll(<double>[-29.79, -30.20, -34.34]),
      );
      expect(
        markers.map((m) => m.point.longitude),
        containsAll(<double>[31.04, 30.79, 18.48]),
      );
    });

    test('tapping a marker reports the exact spot it was built for', () {
      final spotA = _spot(id: 'A', name: 'Spot A', latitude: 1, longitude: 1);
      final spotB = _spot(id: 'B', name: 'Spot B', latitude: 2, longitude: 2);

      FishingSpot? tapped;

      final markers = buildFishingSpotMarkers(
        [spotA, spotB],
        onTap: (spot) => tapped = spot,
      );

      // Simulate tapping the second marker's GestureDetector.
      final gestureDetector = markers[1].child as GestureDetector;
      gestureDetector.onTap!();

      expect(tapped, spotB);
    });
  });

  group('fishingSpotsProvider - failure and empty handling (as consumed by '
      'MapsPage)', () {
    test(
      'a repository failure resolves to a null value, never a fabricated '
      'spot list',
      () async {
        final mockRepository = MockFishingSpotRepository();
        when(() => mockRepository.getAll())
            .thenThrow(Exception('Supabase unavailable'));

        final container = ProviderContainer(
          overrides: [
            fishingSpotRepositoryProvider.overrideWithValue(mockRepository),
          ],
        );
        addTearDown(container.dispose);

        // MapsPage never awaits the future directly - it reads the current
        // AsyncValue via .valueOrNull, which must degrade to null (and, in
        // MapsPage, then to an empty marker list) rather than throwing into
        // the widget tree or fabricating data.
        await container.read(fishingSpotsProvider.future).catchError(
              (_) => const <FishingSpot>[],
            );

        final resolved = container.read(fishingSpotsProvider);
        expect(resolved.hasError, isTrue);
        expect(resolved.valueOrNull, isNull);
      },
    );

    test('an empty directory resolves to an empty list, not an error',
        () async {
      final mockRepository = MockFishingSpotRepository();
      when(() => mockRepository.getAll())
          .thenAnswer((_) async => const <FishingSpot>[]);

      final container = ProviderContainer(
        overrides: [
          fishingSpotRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      final spots = await container.read(fishingSpotsProvider.future);

      expect(spots, isEmpty);
    });

    test('a successful fetch returns all spots from the repository',
        () async {
      final mockRepository = MockFishingSpotRepository();
      final spots = [
        _spot(id: '1', name: 'A', latitude: 1, longitude: 1),
        _spot(id: '2', name: 'B', latitude: 2, longitude: 2),
      ];
      when(() => mockRepository.getAll()).thenAnswer((_) async => spots);

      final container = ProviderContainer(
        overrides: [
          fishingSpotRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      final result = await container.read(fishingSpotsProvider.future);

      expect(result, spots);
    });
  });
}
