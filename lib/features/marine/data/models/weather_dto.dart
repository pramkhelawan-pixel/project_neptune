class WeatherDto {
  final double windSpeed;
  final double windDirection;

  final DateTime sunrise;
  final DateTime sunset;

  const WeatherDto({
    required this.windSpeed,
    required this.windDirection,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    final hourly = json['hourly'] as Map<String, dynamic>? ?? {};
    final daily = json['daily'] as Map<String, dynamic>? ?? {};

    double firstDouble(String key) {
      final values = hourly[key];

      if (values is List && values.isNotEmpty) {
        final value = values.first;

        if (value is num) {
          return value.toDouble();
        }
      }

      return 0.0;
    }

    DateTime firstDateTime(String key) {
      final values = daily[key];

      if (values is List && values.isNotEmpty) {
        final value = values.first;

        if (value is String) {
          return DateTime.parse(value);
        }
      }

      return DateTime.now();
    }

    return WeatherDto(
      windSpeed: firstDouble('wind_speed_10m'),
      windDirection: firstDouble('wind_direction_10m'),
      sunrise: firstDateTime('sunrise'),
      sunset: firstDateTime('sunset'),
    );
  }
}