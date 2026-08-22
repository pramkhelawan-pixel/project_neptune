import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/marine/data/mappers/water_conditions_mapper.dart';
import 'package:project_neptune/features/marine/data/models/marine_weather_dto.dart';

MarineWeatherDto _dto(double seaSurfaceTemperature) {
  return MarineWeatherDto(
    waveHeight: 1.2,
    wavePeriod: 8.0,
    seaSurfaceTemperature: seaSurfaceTemperature,
    swellWaveHeight: 1.0,
    swellWavePeriod: 7.0,
  );
}

void main() {
  group('WaterConditionsMapper.toDomain', () {
    test('no longer always returns the hardcoded 20.0°C', () {
      final result = WaterConditionsMapper.toDomain(_dto(14.7));

      expect(result.temperature, isNot(20.0));
      expect(result.temperature, 14.7);
    });

    test('different sea_surface_temperature inputs produce different '
        'results (not a constant)', () {
      final cold = WaterConditionsMapper.toDomain(_dto(12.0));
      final warm = WaterConditionsMapper.toDomain(_dto(24.5));

      expect(cold.temperature, 12.0);
      expect(warm.temperature, 24.5);
      expect(cold.temperature, isNot(warm.temperature));
    });
  });
}
