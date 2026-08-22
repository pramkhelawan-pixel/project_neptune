import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/marine/data/mappers/swell_conditions_mapper.dart';
import 'package:project_neptune/features/marine/data/models/marine_weather_dto.dart';

MarineWeatherDto _dto({
  required double waveHeight,
  required double wavePeriod,
  required double swellWaveHeight,
  required double swellWavePeriod,
}) {
  return MarineWeatherDto(
    waveHeight: waveHeight,
    wavePeriod: wavePeriod,
    seaSurfaceTemperature: 16.0,
    swellWaveHeight: swellWaveHeight,
    swellWavePeriod: swellWavePeriod,
  );
}

void main() {
  group('SwellConditionsMapper.toDomain', () {
    test('height is mapped from dto.swellWaveHeight, not dto.waveHeight',
        () {
      final dto = _dto(
        waveHeight: 2.0,
        wavePeriod: 10.2,
        swellWaveHeight: 1.76,
        swellWavePeriod: 7.65,
      );

      final result = SwellConditionsMapper.toDomain(dto);

      expect(result.height, 1.76);
      expect(result.height, isNot(2.0));
    });

    test('period is mapped from dto.swellWavePeriod, not dto.wavePeriod',
        () {
      final dto = _dto(
        waveHeight: 2.0,
        wavePeriod: 10.2,
        swellWaveHeight: 1.76,
        swellWavePeriod: 7.65,
      );

      final result = SwellConditionsMapper.toDomain(dto);

      expect(result.period, 7.65);
      expect(result.period, isNot(10.2));
    });

    test(
      'when the generic wave and true swell values differ, the mapper '
      'always reports the swell-specific numbers',
      () {
        final dto = _dto(
          waveHeight: 3.5,
          wavePeriod: 12.0,
          swellWaveHeight: 0.9,
          swellWavePeriod: 6.2,
        );

        final result = SwellConditionsMapper.toDomain(dto);

        expect(result.height, 0.9);
        expect(result.period, 6.2);
      },
    );

    test('direction remains "Unknown" - out of scope for this change', () {
      final dto = _dto(
        waveHeight: 2.0,
        wavePeriod: 10.2,
        swellWaveHeight: 1.76,
        swellWavePeriod: 7.65,
      );

      final result = SwellConditionsMapper.toDomain(dto);

      expect(result.direction, 'Unknown');
    });
  });
}
