import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:project_neptune/core/theme/app_colors.dart';
import 'package:project_neptune/core/theme/app_theme.dart';
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

  group('FishingSpotDetailsSheet - text contrast', () {
    Future<void> pumpSheet(WidgetTester tester, FishingSpot spot) {
      return tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.neptune,
          home: Scaffold(
            body: FishingSpotDetailsSheet(spot: spot),
          ),
        ),
      );
    }

    testWidgets(
      'the No-Take Zone chip renders dark, readable text on its pale '
      'background rather than the theme\'s near-white chip label default',
      (tester) async {
        final spot = _spot(
          id: 'NO-TAKE',
          name: 'Kosi Bay Mouth',
          latitude: -26.9,
          longitude: 32.85,
        );
        final noTakeSpot = FishingSpot(
          id: spot.id,
          province: spot.province,
          region: spot.region,
          name: spot.name,
          latitude: spot.latitude,
          longitude: spot.longitude,
          spotType: spot.spotType,
          accessNotes: 'Estuary mouth, tidal access only.',
          targetSpecies: spot.targetSpecies,
          isMpa: true,
          mpaName: 'Kosi Bay Marine Reserve',
          isNoTake: true,
          safetyFlags: const ['Strong currents'],
          createdAt: spot.createdAt,
        );

        await pumpSheet(tester, noTakeSpot);

        final noTakeText = tester.widget<Text>(find.text('No-Take Zone'));
        expect(noTakeText.style?.color, Colors.black87);

        final safetyFlagText = tester.widget<Text>(find.text('Strong currents'));
        expect(safetyFlagText.style?.color, Colors.black87);
      },
    );

    testWidgets(
      'the location name, spot type, and access notes all use an '
      'explicit high-contrast theme text style rather than an unstyled '
      '(accidentally muted) default',
      (tester) async {
        final spot = _spot(
          id: 'DESC',
          name: 'Kosi Bay Mouth',
          latitude: -26.9,
          longitude: 32.85,
        );
        final described = FishingSpot(
          id: spot.id,
          province: spot.province,
          region: spot.region,
          name: spot.name,
          latitude: spot.latitude,
          longitude: spot.longitude,
          spotType: 'Estuary',
          accessNotes: 'Accessible via 4x4 track only.',
          targetSpecies: spot.targetSpecies,
          isMpa: false,
          isNoTake: false,
          safetyFlags: const [],
          createdAt: spot.createdAt,
        );

        await pumpSheet(tester, described);

        final nameText = tester.widget<Text>(find.text('Kosi Bay Mouth'));
        expect(nameText.style?.color, AppColors.textPrimary);

        final spotTypeText = tester.widget<Text>(find.text('Estuary'));
        expect(spotTypeText.style?.color, AppColors.textPrimary);

        final notesText =
            tester.widget<Text>(find.text('Accessible via 4x4 track only.'));
        expect(notesText.style?.color, AppColors.textPrimary);
      },
    );
  });

  group('FishingSpotDetailsSheet - vertical overflow', () {
    testWidgets(
      'a spot with a long access note, several safety flags, and a full '
      'target-species list does not overflow when the sheet has limited '
      'vertical space (regression for "BOTTOM OVERFLOWED BY 56 PIXELS")',
      (tester) async {
        final base = _spot(
          id: 'KOSI-BAY-MOUTH',
          name: 'Kosi Bay Mouth',
          latitude: -26.9,
          longitude: 32.85,
        );
        final busySpot = FishingSpot(
          id: base.id,
          province: base.province,
          region: base.region,
          name: base.name,
          latitude: base.latitude,
          longitude: base.longitude,
          spotType: 'Estuary mouth',
          accessNotes: 'Estuary mouth with tidal access only; a 4x4 track '
              'is recommended in wet conditions and the crossing should '
              'be timed around low tide for safety.',
          targetSpecies: const [
            'Kingfish',
            'Grunter',
            'Springer',
            'Perch',
            'Snapper',
            'Shad',
            'Garrick',
          ],
          isMpa: true,
          mpaName: 'Kosi Bay Marine Reserve',
          isNoTake: true,
          safetyFlags: const [
            'Strong currents',
            'Crocodiles present',
            'Slippery rocks',
          ],
          createdAt: base.createdAt,
        );

        // A small fixed height stands in for a small-device modal bottom
        // sheet, so content that doesn't fit must scroll rather than
        // overflow the render box.
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.neptune,
            home: Scaffold(
              body: SizedBox(
                height: 300,
                child: FishingSpotDetailsSheet(spot: busySpot),
              ),
            ),
          ),
        );

        expect(tester.takeException(), isNull);

        // Nothing was dropped to make it fit -- the last section is still
        // in the tree, just off-screen until scrolled to.
        expect(find.text('Target Species'), findsOneWidget);
        await tester.dragUntilVisible(
          find.text('Garrick'),
          find.byType(SingleChildScrollView),
          const Offset(0, -50),
        );
        expect(find.text('Garrick'), findsOneWidget);
      },
    );
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
