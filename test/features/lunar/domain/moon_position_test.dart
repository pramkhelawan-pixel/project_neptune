import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/lunar/domain/moon_position.dart';

void main() {
  // Same reference new moon LunarEngine anchors its own calculation to
  // (see lunar_engine_test.dart) — a genuinely historical new moon, so the
  // Moon and Sun should be in near-conjunction (elongation close to 0°).
  final knownNewMoon = DateTime.utc(2000, 1, 6, 18, 14);
  const synodicMonth = 29.53058867;

  final knownFullMoon = knownNewMoon.add(
    Duration(
      milliseconds: ((synodicMonth / 2) * 24 * 60 * 60 * 1000).round(),
    ),
  );

  group('MoonPosition.geocentricElongationDegrees', () {
    test('is near 0 degrees at a known new moon (Moon/Sun in conjunction)',
        () {
      final elongation =
          MoonPosition.geocentricElongationDegrees(knownNewMoon);

      final distanceFromZero =
          elongation <= 180 ? elongation : 360 - elongation;

      expect(distanceFromZero, lessThan(10.0));
    });

    test('is near 180 degrees at a known full moon (Moon/Sun in '
        'opposition)', () {
      final elongation =
          MoonPosition.geocentricElongationDegrees(knownFullMoon);

      expect((elongation - 180).abs(), lessThan(10.0));
    });

    test('is deterministic for the same instant', () {
      final first = MoonPosition.geocentricElongationDegrees(knownFullMoon);
      final second = MoonPosition.geocentricElongationDegrees(knownFullMoon);

      expect(first, second);
    });
  });

  group('MoonPosition.altitudeDegrees', () {
    test('always returns a physically valid altitude', () {
      final dates = [
        DateTime.utc(2026, 1, 1),
        DateTime.utc(2026, 6, 15, 12),
        DateTime.utc(2026, 12, 31, 23, 59),
      ];

      const locations = [
        (-29.7919, 31.0446), // Durban, South Africa
        (51.5074, -0.1278), // London
        (64.1466, -21.9426), // Reykjavik
        (0.0, 0.0), // Equator / prime meridian
      ];

      for (final date in dates) {
        for (final location in locations) {
          final altitude = MoonPosition.altitudeDegrees(
            utc: date,
            latitude: location.$1,
            longitude: location.$2,
          );

          expect(altitude, greaterThanOrEqualTo(-90.0));
          expect(altitude, lessThanOrEqualTo(90.0));
          expect(altitude.isNaN, isFalse);
        }
      }
    });

    test('is deterministic for the same inputs', () {
      final first = MoonPosition.altitudeDegrees(
        utc: knownFullMoon,
        latitude: -29.7919,
        longitude: 31.0446,
      );

      final second = MoonPosition.altitudeDegrees(
        utc: knownFullMoon,
        latitude: -29.7919,
        longitude: 31.0446,
      );

      expect(first, second);
    });

    test('differs between two distinct observer longitudes at the same '
        'instant (hour angle depends on longitude)', () {
      final west = MoonPosition.altitudeDegrees(
        utc: DateTime.utc(2026, 6, 15, 12),
        latitude: -29.7919,
        longitude: 31.0446,
      );

      final east = MoonPosition.altitudeDegrees(
        utc: DateTime.utc(2026, 6, 15, 12),
        latitude: -29.7919,
        longitude: -120.0,
      );

      expect(west, isNot(east));
    });

    test('differs between Northern and Southern Hemisphere observers at '
        'the same instant and longitude', () {
      final south = MoonPosition.altitudeDegrees(
        utc: DateTime.utc(2026, 6, 15, 12),
        latitude: -29.7919,
        longitude: 31.0446,
      );

      final north = MoonPosition.altitudeDegrees(
        utc: DateTime.utc(2026, 6, 15, 12),
        latitude: 29.7919,
        longitude: 31.0446,
      );

      expect(south, isNot(north));
    });
  });
}
