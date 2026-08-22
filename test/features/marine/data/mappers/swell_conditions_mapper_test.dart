import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/marine/data/mappers/swell_conditions_mapper.dart';
import 'package:project_neptune/features/marine/data/models/marine_weather_dto.dart';

MarineWeatherDto _dto({
  double waveHeight = 2.0,
  double wavePeriod = 10.2,
  required double swellWaveHeight,
  required double swellWavePeriod,
  double swellWaveDirection = 0.0,
}) {
  return MarineWeatherDto(
    waveHeight: waveHeight,
    wavePeriod: wavePeriod,
    seaSurfaceTemperature: 16.0,
    swellWaveHeight: swellWaveHeight,
    swellWavePeriod: swellWavePeriod,
    swellWaveDirection: swellWaveDirection,
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

    group('direction - degrees to compass conversion', () {
      // (input degrees, expected compass abbreviation)
      const cases = <(double, String)>[
        (0, 'N'),
        (45, 'NE'),
        (90, 'E'),
        (135, 'SE'),
        (180, 'S'),
        (225, 'SW'),
        (270, 'W'),
        (315, 'NW'),
        // Boundary values either side of each bucket edge.
        (22.4, 'N'),
        (22.5, 'NE'),
        (337.4, 'NW'),
        (337.5, 'N'),
        (360, 'N'),
      ];

      for (final (degrees, expected) in cases) {
        test('$degrees° -> $expected', () {
          final dto = _dto(
            swellWaveHeight: 1.5,
            swellWavePeriod: 8.0,
            swellWaveDirection: degrees,
          );

          final result = SwellConditionsMapper.toDomain(dto);

          expect(result.direction, expected);
        });
      }
    });

    test(
      'direction is a real compass value, no longer the hardcoded '
      '"Unknown"',
      () {
        final dto = _dto(
          swellWaveHeight: 1.5,
          swellWavePeriod: 8.0,
          swellWaveDirection: 227,
        );

        final result = SwellConditionsMapper.toDomain(dto);

        expect(result.direction, isNot('Unknown'));
        expect(result.direction, 'SW');
      },
    );
  });
}
