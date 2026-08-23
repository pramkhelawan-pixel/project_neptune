import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/lunar/domain/solunar_engine.dart';

void main() {
  const engine = SolunarEngine();

  // Durban, South Africa — a fixed Southern Hemisphere reference location
  // (same coordinates as the Blue Lagoon fishing-spot fixture). At this
  // latitude the Moon's declination (max ~28.6°) never exceeds the
  // observer's co-latitude (~60.2°), so the Moon rises and sets every
  // single day — a useful guarantee for deterministic assertions below.
  const durbanLatitude = -29.7919;
  const durbanLongitude = 31.0446;

  group('SolunarEngine.calculate — determinism', () {
    test('is deterministic and repeatable for identical inputs', () {
      final date = DateTime.utc(2026, 6, 15);

      final first = engine.calculate(
        date,
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      final second = engine.calculate(
        date,
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      expect(first.moonrise, second.moonrise);
      expect(first.moonset, second.moonset);
      expect(first.majorPeriods, equals(second.majorPeriods));
      expect(first.minorPeriods, equals(second.minorPeriods));
    });

    test('a local (non-UTC) DateTime for a given instant produces the same '
        'result as its UTC equivalent', () {
      final utcDate = DateTime.utc(2026, 6, 15, 10);
      final localEquivalent = utcDate.toLocal();

      final utcResult = engine.calculate(
        utcDate,
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      final localResult = engine.calculate(
        localEquivalent,
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      expect(localResult.moonrise, utcResult.moonrise);
      expect(localResult.moonset, utcResult.moonset);
      expect(localResult.majorPeriods, equals(utcResult.majorPeriods));
    });
  });

  group('SolunarEngine.calculate — Southern Hemisphere normal day', () {
    test('produces a real moonrise and moonset on most days at Durban '
        "latitude (the Moon's declination never makes it circumpolar this "
        'close to the equator, so the rare missing event is the calendar-'
        'day-boundary case below, not a circumpolar one)', () {
      var daysWithBoth = 0;
      const sampledDays = 10;

      for (var day = 1; day <= 28; day += 3) {
        final result = engine.calculate(
          DateTime.utc(2026, 3, day),
          latitude: durbanLatitude,
          longitude: durbanLongitude,
        );

        if (result.moonrise != null && result.moonset != null) {
          daysWithBoth++;
        }
      }

      // Moonrise/moonset drift ~50 minutes later each solar day, so
      // roughly one day per synodic month legitimately has no moonrise or
      // no moonset within a given UTC calendar day (see the boundary test
      // below) — this is expected, not a defect, so the assertion allows
      // for exactly that, rather than requiring every sampled day to have
      // both events.
      expect(daysWithBoth, greaterThanOrEqualTo(sampledDays - 1));
    });

    test('a day where the ~24h50m lunar day slips past the 24h00m '
        'calendar day legitimately has no moonset, even at an ordinary '
        'latitude — this is real astronomical behaviour, not a defect',
        () {
      final result = engine.calculate(
        DateTime.utc(2026, 3, 28),
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      expect(result.moonset, isNull);
      expect(result.moonrise, isNotNull);
      // Major periods are unaffected — they don't depend on rise/set.
      expect(result.majorPeriods, hasLength(2));
      // Only the moonrise minor period is present; no fabricated moonset
      // period is synthesised for the missing event.
      expect(result.minorPeriods, hasLength(1));
    });

    test('always produces exactly two major periods (transit and '
        'antitransit occur regardless of visibility)', () {
      final result = engine.calculate(
        DateTime.utc(2026, 6, 15),
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      expect(result.majorPeriods, hasLength(2));
    });

    test('every period is exactly two hours wide, centred on its event',
        () {
      final result = engine.calculate(
        DateTime.utc(2026, 6, 15),
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      for (final period in [...result.majorPeriods, ...result.minorPeriods]) {
        expect(period.end.difference(period.start), const Duration(hours: 2));
      }
    });

    test('minor periods are centred exactly on moonrise and moonset', () {
      final result = engine.calculate(
        DateTime.utc(2026, 6, 15),
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      final moonrise = result.moonrise!;
      final moonset = result.moonset!;

      expect(result.minorPeriods, hasLength(2));

      final riseWindow = result.minorPeriods.firstWhere(
        (p) => p.start == moonrise.subtract(const Duration(hours: 1)),
      );
      expect(riseWindow.end, moonrise.add(const Duration(hours: 1)));

      final setWindow = result.minorPeriods.firstWhere(
        (p) => p.start == moonset.subtract(const Duration(hours: 1)),
      );
      expect(setWindow.end, moonset.add(const Duration(hours: 1)));
    });

    test('moonrise and moonset fall within the requested UTC calendar day',
        () {
      final date = DateTime.utc(2026, 6, 15);

      final result = engine.calculate(
        date,
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      final dayStart = DateTime.utc(2026, 6, 15);
      final dayEnd = DateTime.utc(2026, 6, 16);

      expect(result.moonrise!.isBefore(dayEnd), isTrue);
      expect(result.moonrise!.isAfter(dayStart), isTrue);
      expect(result.moonset!.isBefore(dayEnd), isTrue);
      expect(result.moonset!.isAfter(dayStart), isTrue);
    });

    test('near-midnight instants on the same UTC day resolve to the same '
        'day scan', () {
      final earlyInDay = engine.calculate(
        DateTime.utc(2026, 6, 15, 0, 1),
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      final lateInDay = engine.calculate(
        DateTime.utc(2026, 6, 15, 23, 59),
        latitude: durbanLatitude,
        longitude: durbanLongitude,
      );

      expect(earlyInDay.moonrise, lateInDay.moonrise);
      expect(earlyInDay.moonset, lateInDay.moonset);
    });
  });

  group('SolunarEngine.calculate — moonrise/moonset unavailable', () {
    test('at a near-polar latitude, at least one of moonrise/moonset is '
        'absent on a given day (the Moon is circumpolar or never rises '
        'whenever its declination exceeds the ~0.2° co-latitude margin, '
        'which is true almost every day this close to the pole)', () {
      final result = engine.calculate(
        DateTime.utc(2026, 6, 15),
        latitude: 89.8,
        longitude: 0.0,
      );

      expect(result.moonrise == null || result.moonset == null, isTrue);
    });

    test('major periods are still computed even when moonrise/moonset are '
        'unavailable', () {
      final result = engine.calculate(
        DateTime.utc(2026, 6, 15),
        latitude: 89.8,
        longitude: 0.0,
      );

      expect(result.majorPeriods, hasLength(2));
    });

    test('minor periods list omits the missing event rather than throwing',
        () {
      final result = engine.calculate(
        DateTime.utc(2026, 6, 15),
        latitude: 89.8,
        longitude: 0.0,
      );

      expect(result.minorPeriods.length, lessThan(2));
    });
  });
}
