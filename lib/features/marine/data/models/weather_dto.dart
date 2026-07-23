class WeatherDto {
  final double windSpeed;
  final double windDirection;

  const WeatherDto({
    required this.windSpeed,
    required this.windDirection,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    final hourly = json['hourly'] as Map<String, dynamic>? ?? {};

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

    return WeatherDto(
      windSpeed: firstValue('wind_speed_10m'),
      windDirection: firstValue('wind_direction_10m'),
    );
  }
}