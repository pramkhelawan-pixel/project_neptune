class WeatherDto {
  final double windSpeed;
  final double windDirection;
  final double windGust;

  final double airTemperature;
  final double humidity;
  final double pressure;
  final double visibility;
  final double cloudCover;
  final double precipitation;
  final double precipitationProbability;

  final DateTime sunrise;
  final DateTime sunset;

  const WeatherDto({
    required this.windSpeed,
    required this.windDirection,
    required this.windGust,
    required this.airTemperature,
    required this.humidity,
    required this.pressure,
    required this.visibility,
    required this.cloudCover,
    required this.precipitation,
    required this.precipitationProbability,
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
      windGust: firstDouble('wind_gusts_10m'),
      airTemperature: firstDouble('temperature_2m'),
      humidity: firstDouble('relative_humidity_2m'),
      pressure: firstDouble('pressure_msl'),
      visibility: firstDouble('visibility'),
      cloudCover: firstDouble('cloud_cover'),
      precipitation: firstDouble('precipitation'),
      precipitationProbability: firstDouble('precipitation_probability'),
      sunrise: firstDateTime('sunrise'),
      sunset: firstDateTime('sunset'),
    );
  }
}