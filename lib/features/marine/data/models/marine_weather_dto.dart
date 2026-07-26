class MarineConditions {
  final double windSpeed;
  final String windDirection;

  final double swellHeight;
  final double swellPeriod;

  /// Human-readable tide description.
  final String tide;

  /// Current tide height (metres).
  final double tideHeight;

  /// Next predicted high tide.
  final DateTime? nextHighTide;

  /// Next predicted low tide.
  final DateTime? nextLowTide;

  /// Incoming, Outgoing, High, Low.
  final String tideState;

  /// Moon information.
  final String moonPhase;
  final double moonIllumination;

  /// Astronomy.
  final DateTime sunrise;
  final DateTime sunset;

  const MarineConditions({
    required this.windSpeed,
    required this.windDirection,
    required this.swellHeight,
    required this.swellPeriod,
    required this.tide,
    required this.tideHeight,
    required this.nextHighTide,
    required this.nextLowTide,
    required this.tideState,
    required this.moonPhase,
    required this.moonIllumination,
    required this.sunrise,
    required this.sunset,
  });

  MarineConditions copyWith({
    double? windSpeed,
    String? windDirection,
    double? swellHeight,
    double? swellPeriod,
    String? tide,
    double? tideHeight,
    DateTime? nextHighTide,
    DateTime? nextLowTide,
    String? tideState,
    String? moonPhase,
    double? moonIllumination,
    DateTime? sunrise,
    DateTime? sunset,
  }) {
    return MarineConditions(
      windSpeed: windSpeed ?? this.windSpeed,
      windDirection: windDirection ?? this.windDirection,
      swellHeight: swellHeight ?? this.swellHeight,
      swellPeriod: swellPeriod ?? this.swellPeriod,
      tide: tide ?? this.tide,
      tideHeight: tideHeight ?? this.tideHeight,
      nextHighTide: nextHighTide ?? this.nextHighTide,
      nextLowTide: nextLowTide ?? this.nextLowTide,
      tideState: tideState ?? this.tideState,
      moonPhase: moonPhase ?? this.moonPhase,
      moonIllumination:
      moonIllumination ?? this.moonIllumination,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }
}