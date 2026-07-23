class MarineConditions {
  final double windSpeed;
  final String windDirection;

  final double swellHeight;
  final double swellPeriod;

  final String tide;

  final String moonPhase;

  final DateTime sunrise;
  final DateTime sunset;

  const MarineConditions({
    required this.windSpeed,
    required this.windDirection,
    required this.swellHeight,
    required this.swellPeriod,
    required this.tide,
    required this.moonPhase,
    required this.sunrise,
    required this.sunset,
  });
}