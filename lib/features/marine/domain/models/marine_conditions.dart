class MarineConditions {
  final double windSpeed;
  final String windDirection;

  final double swellHeight;
  final double swellPeriod;

  /// Sea surface temperature (°C)
  final double waterTemperature;

  /// Existing field used by the current UI.
  final String tide;

  /// Current tide height in metres.
  final double tideHeight;

  /// Next predicted high tide.
  final DateTime? nextHighTide;

  /// Next predicted low tide.
  final DateTime? nextLowTide;

  /// Tide state such as "Incoming", "Outgoing",
  /// "High", "Low", or "Unknown".
  final String tideState;

  final String moonPhase;

  final DateTime sunrise;
  final DateTime sunset;

  const MarineConditions({
    required this.windSpeed,
    required this.windDirection,
    required this.swellHeight,
    required this.swellPeriod,
    required this.waterTemperature,
    required this.tide,
    required this.tideHeight,
    required this.nextHighTide,
    required this.nextLowTide,
    required this.tideState,
    required this.moonPhase,
    required this.sunrise,
    required this.sunset,
  });

  MarineConditions copyWith({
    double? windSpeed,
    String? windDirection,
    double? swellHeight,
    double? swellPeriod,
    double? waterTemperature,
    String? tide,
    double? tideHeight,
    DateTime? nextHighTide,
    DateTime? nextLowTide,
    String? tideState,
    String? moonPhase,
    DateTime? sunrise,
    DateTime? sunset,
  }) {
    return MarineConditions(
      windSpeed: windSpeed ?? this.windSpeed,
      windDirection: windDirection ?? this.windDirection,
      swellHeight: swellHeight ?? this.swellHeight,
      swellPeriod: swellPeriod ?? this.swellPeriod,
      waterTemperature:
      waterTemperature ?? this.waterTemperature,
      tide: tide ?? this.tide,
      tideHeight: tideHeight ?? this.tideHeight,
      nextHighTide: nextHighTide ?? this.nextHighTide,
      nextLowTide: nextLowTide ?? this.nextLowTide,
      tideState: tideState ?? this.tideState,
      moonPhase: moonPhase ?? this.moonPhase,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }
}