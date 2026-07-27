class MarineWeatherDto {
  final double waveHeight;
  final double wavePeriod;

  const MarineWeatherDto({
    required this.waveHeight,
    required this.wavePeriod,
  });

  factory MarineWeatherDto.fromJson(
      Map<String, dynamic> json,
      ) {
    final hourly =
        json['hourly'] as Map<String, dynamic>? ?? {};

    double firstValue(String key) {
      final values = hourly[key];

      if (values is List && values.isNotEmpty) {
        final value = values.first;

        if (value is num) {
          return value.toDouble();
        }
      }

      return 0.0;
    }

    return MarineWeatherDto(
      waveHeight: firstValue('wave_height'),
      wavePeriod: firstValue('wave_period'),
    );
  }
}