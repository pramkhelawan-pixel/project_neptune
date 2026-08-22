import 'package:flutter_test/flutter_test.dart';

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

MarineConditions _canonicalConditions({required String swellDirection}) {
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
    moon: const LunarConditions(phase: MoonPhase.fullMoon, illumination: 100),
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
}
