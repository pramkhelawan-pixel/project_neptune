import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/lunar/domain/solunar_period.dart';
import 'package:project_neptune/features/marine/data/mappers/marine_conditions_legacy_mapper.dart';
import 'package:project_neptune/features/marine/domain/entities/marine_conditions.dart';
import 'package:project_neptune/features/marine/domain/enums/cloud_cover.dart';
import 'package:project_neptune/features/marine/domain/enums/moon_phase.dart';
import 'package:project_neptune/features/marine/domain/enums/tide_state.dart';
import 'package:project_neptune/features/marine/domain/enums/water_colour.dart';
import 'package:project_neptune/features/marine/domain/enums/wind_direction.dart';
import 'package:project_neptune/features/marine/domain/value_objects/atmospheric_conditions.dart';
import 'package:project_neptune/features/marine/domain/value_objects/current_conditions.dart';
import 'package:project_neptune/features/marine/domain/value_objects/location_conditions.dart';
import 'package:project_neptune/features/marine/domain/value_objects/lunar_conditions.dart';
import 'package:project_neptune/features/marine/domain/value_objects/observation_metadata.dart';
import 'package:project_neptune/features/marine/domain/value_objects/solar_conditions.dart';
import 'package:project_neptune/features/marine/domain/value_objects/swell_conditions.dart';
import 'package:project_neptune/features/marine/domain/value_objects/tide_conditions.dart';
import 'package:project_neptune/features/marine/domain/value_objects/water_conditions.dart';
import 'package:project_neptune/features/marine/domain/value_objects/wind_conditions.dart';

MarineConditions _canonicalConditions({
  required String swellDirection,
  LunarConditions moon = const LunarConditions(
    phase: MoonPhase.fullMoon,
    illumination: 100,
  ),
}) {
  final now = DateTime(2026, 1, 1, 12);

  return MarineConditions(
    wind: const WindConditions(
      speed: 10,
      direction: WindDirection.southWest,
      gust: 15,
    ),
    tide: TideConditions(
      state: TideState.incoming,
      height: 1.2,
      nextHigh: DateTime(2026, 1, 1, 18),
      nextLow: DateTime(2026, 1, 1, 6),
    ),
    swell: SwellConditions(
      height: 1.76,
      period: 7.65,
      direction: swellDirection,
    ),
    current: const CurrentConditions(speed: 0, direction: 'Unknown'),
    water: const WaterConditions(
      temperature: 16.0,
      clarity: 2.0,
      colour: WaterColour.blueGreen,
      salinity: 35.0,
    ),
    atmosphere: const AtmosphericConditions(
      pressure: 1015,
      humidity: 60,
      airTemperature: 22,
      visibility: 10000,
      cloudCover: CloudCover.clear,
      precipitation: 0,
      precipitationProbability: 0,
    ),
    moon: moon,
    sun: SolarConditions(
      sunrise: DateTime(2026, 1, 1, 5, 30),
      sunset: DateTime(2026, 1, 1, 19, 30),
    ),
    location: const LocationConditions(
      country: '',
      province: '',
      region: '',
      beach: 'Current Location',
      latitude: -33.9249,
      longitude: 18.4241,
    ),
    metadata: ObservationMetadata(
      observedAt: now,
      publishedAt: now,
      provider: 'test',
      confidence: 95,
    ),
  );
}

void main() {
  group('MarineConditionsLegacyMapper.toLegacy - swell direction', () {
    test('a real swell direction survives the transition into the legacy '
        'MarineConditions model', () {
      final source = _canonicalConditions(swellDirection: 'SW');

      final result = MarineConditionsLegacyMapper.toLegacy(source);

      expect(result.swellDirection, 'SW');
      expect(result.swellDirection, isNot('Unknown'));
    });

    test('height and period continue to survive unchanged alongside '
        'direction', () {
      final source = _canonicalConditions(swellDirection: 'NE');

      final result = MarineConditionsLegacyMapper.toLegacy(source);

      expect(result.swellHeight, 1.76);
      expect(result.swellPeriod, 7.65);
      expect(result.swellDirection, 'NE');
    });
  });

  group('MarineConditionsLegacyMapper.toLegacy - observedAt', () {
    test(
      'metadata.observedAt survives the transition into the legacy '
      'MarineConditions model',
      () {
        final source = _canonicalConditions(swellDirection: 'SW');

        final result = MarineConditionsLegacyMapper.toLegacy(source);

        expect(result.observedAt, source.metadata.observedAt);
      },
    );
  });

  group('MarineConditionsLegacyMapper.toLegacy - Solunar', () {
    test('moonrise survives the transition into the legacy model', () {
      final moonrise = DateTime(2026, 1, 1, 6, 12);

      final source = _canonicalConditions(
        swellDirection: 'SW',
        moon: LunarConditions(
          phase: MoonPhase.fullMoon,
          illumination: 100,
          moonrise: moonrise,
        ),
      );

      final result = MarineConditionsLegacyMapper.toLegacy(source);

      expect(result.moonrise, moonrise);
    });

    test('moonset survives the transition into the legacy model', () {
      final moonset = DateTime(2026, 1, 1, 18, 47);

      final source = _canonicalConditions(
        swellDirection: 'SW',
        moon: LunarConditions(
          phase: MoonPhase.fullMoon,
          illumination: 100,
          moonset: moonset,
        ),
      );

      final result = MarineConditionsLegacyMapper.toLegacy(source);

      expect(result.moonset, moonset);
    });

    test('major periods survive the transition into the legacy model '
        'unchanged', () {
      final majorPeriods = [
        SolunarPeriod(
          start: DateTime(2026, 1, 1, 11),
          end: DateTime(2026, 1, 1, 13),
        ),
        SolunarPeriod(
          start: DateTime(2026, 1, 1, 23),
          end: DateTime(2026, 1, 2, 1),
        ),
      ];

      final source = _canonicalConditions(
        swellDirection: 'SW',
        moon: LunarConditions(
          phase: MoonPhase.fullMoon,
          illumination: 100,
          majorPeriods: majorPeriods,
        ),
      );

      final result = MarineConditionsLegacyMapper.toLegacy(source);

      expect(result.majorPeriods, majorPeriods);
    });

    test('minor periods survive the transition into the legacy model '
        'unchanged', () {
      final minorPeriods = [
        SolunarPeriod(
          start: DateTime(2026, 1, 1, 5, 12),
          end: DateTime(2026, 1, 1, 7, 12),
        ),
      ];

      final source = _canonicalConditions(
        swellDirection: 'SW',
        moon: LunarConditions(
          phase: MoonPhase.fullMoon,
          illumination: 100,
          minorPeriods: minorPeriods,
        ),
      );

      final result = MarineConditionsLegacyMapper.toLegacy(source);

      expect(result.minorPeriods, minorPeriods);
    });

    test('an unavailable moonrise/moonset (Moon does not rise or set that '
        'day) maps to null, honestly, rather than substituting a fabricated '
        'time', () {
      final source = _canonicalConditions(
        swellDirection: 'SW',
        moon: const LunarConditions(
          phase: MoonPhase.fullMoon,
          illumination: 100,
          // moonrise/moonset intentionally omitted (null default).
        ),
      );

      final result = MarineConditionsLegacyMapper.toLegacy(source);

      expect(result.moonrise, isNull);
      expect(result.moonset, isNull);
    });

    test('an empty minor-periods list (no moonrise/moonset that day) maps '
        'to an empty list, not a fabricated period', () {
      final source = _canonicalConditions(
        swellDirection: 'SW',
        moon: const LunarConditions(
          phase: MoonPhase.fullMoon,
          illumination: 100,
        ),
      );

      final result = MarineConditionsLegacyMapper.toLegacy(source);

      expect(result.minorPeriods, isEmpty);
    });

    test('the existing lunar-phase display is unaffected by the new '
        'Solunar fields', () {
      final source = _canonicalConditions(
        swellDirection: 'SW',
        moon: LunarConditions(
          phase: MoonPhase.newMoon,
          illumination: 2,
          moonrise: DateTime(2026, 1, 1, 6),
          moonset: DateTime(2026, 1, 1, 18),
        ),
      );

      final result = MarineConditionsLegacyMapper.toLegacy(source);

      expect(result.moonPhase, 'New Moon');
    });
  });
}
