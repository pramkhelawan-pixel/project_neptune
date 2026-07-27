class DecisionContext {
  final String location;

  final DateTime dateTime;

  final String species;

  final String moonPhase;

  final String tide;

  final double waterTemperature;

  final double swellHeight;

  final String windDirection;

  final double windSpeed;

  const DecisionContext({
    required this.location,
    required this.dateTime,
    required this.species,
    required this.moonPhase,
    required this.tide,
    required this.waterTemperature,
    required this.swellHeight,
    required this.windDirection,
    required this.windSpeed,
  });
}