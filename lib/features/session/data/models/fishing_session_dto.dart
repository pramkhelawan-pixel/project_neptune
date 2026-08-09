/// Row shape for the Supabase `fishing_sessions` table.
///
/// The marine-conditions fields are a point-in-time snapshot taken when the
/// session was created — not a live reference to [MarineConditions].
class FishingSessionDto {
  final String id;
  final String userId;
  final String location;
  final String targetSpecies;
  final DateTime dateTime;

  final double? windSpeed;
  final String? windDirection;
  final double? swellHeight;
  final double? swellPeriod;
  final double? waterTemperature;
  final double? airTemperature;
  final double? atmosphericPressure;
  final double? tideHeight;
  final String? tideState;
  final DateTime? nextHighTide;
  final DateTime? nextLowTide;
  final String? moonPhase;
  final DateTime? sunrise;
  final DateTime? sunset;

  const FishingSessionDto({
    required this.id,
    required this.userId,
    required this.location,
    required this.targetSpecies,
    required this.dateTime,
    this.windSpeed,
    this.windDirection,
    this.swellHeight,
    this.swellPeriod,
    this.waterTemperature,
    this.airTemperature,
    this.atmosphericPressure,
    this.tideHeight,
    this.tideState,
    this.nextHighTide,
    this.nextLowTide,
    this.moonPhase,
    this.sunrise,
    this.sunset,
  });

  factory FishingSessionDto.fromJson(Map<String, dynamic> json) {
    return FishingSessionDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      location: json['location'] as String,
      targetSpecies: json['target_species'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDirection: json['wind_direction'] as String?,
      swellHeight: (json['swell_height'] as num?)?.toDouble(),
      swellPeriod: (json['swell_period'] as num?)?.toDouble(),
      waterTemperature: (json['water_temperature'] as num?)?.toDouble(),
      airTemperature: (json['air_temperature'] as num?)?.toDouble(),
      atmosphericPressure: (json['atmospheric_pressure'] as num?)?.toDouble(),
      tideHeight: (json['tide_height'] as num?)?.toDouble(),
      tideState: json['tide_state'] as String?,
      nextHighTide: json['next_high_tide'] == null
          ? null
          : DateTime.parse(json['next_high_tide'] as String),
      nextLowTide: json['next_low_tide'] == null
          ? null
          : DateTime.parse(json['next_low_tide'] as String),
      moonPhase: json['moon_phase'] as String?,
      sunrise: json['sunrise'] == null
          ? null
          : DateTime.parse(json['sunrise'] as String),
      sunset: json['sunset'] == null
          ? null
          : DateTime.parse(json['sunset'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'location': location,
      'target_species': targetSpecies,
      'date_time': dateTime.toIso8601String(),
      'wind_speed': windSpeed,
      'wind_direction': windDirection,
      'swell_height': swellHeight,
      'swell_period': swellPeriod,
      'water_temperature': waterTemperature,
      'air_temperature': airTemperature,
      'atmospheric_pressure': atmosphericPressure,
      'tide_height': tideHeight,
      'tide_state': tideState,
      'next_high_tide': nextHighTide?.toIso8601String(),
      'next_low_tide': nextLowTide?.toIso8601String(),
      'moon_phase': moonPhase,
      'sunrise': sunrise?.toIso8601String(),
      'sunset': sunset?.toIso8601String(),
    };
  }
}
