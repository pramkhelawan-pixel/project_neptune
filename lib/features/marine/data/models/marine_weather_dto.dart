class MarineWeatherDto {
  final double windSpeed;
  final double windDirection;
  final double waveHeight;
  final double wavePeriod;

  const MarineWeatherDto({
    required this.windSpeed,
    required this.windDirection,
    required this.waveHeight,
    required this.wavePeriod,
  });

  factory MarineWeatherDto.fromJson(Map<String, dynamic> json) {
    final hourly = json['hourly'] as Map<String, dynamic>;

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
      windSpeed: firstValue('wind_speed_10m'),
      windDirection: firstValue('wind_direction_10m'),
      waveHeight: firstValue('wave_height'),
      wavePeriod: firstValue('wave_period'),
    );
  }
}