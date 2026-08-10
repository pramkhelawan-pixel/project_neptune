/// Row shape for the Supabase `fishing_spots` table.
class FishingSpotDto {
  final String id;
  final String province;
  final String region;
  final String name;
  final double latitude;
  final double longitude;
  final String spotType;
  final String? accessNotes;
  final List<String> targetSpecies;
  final bool isMpa;
  final String? mpaName;
  final bool isNoTake;
  final List<String> safetyFlags;
  final DateTime createdAt;

  const FishingSpotDto({
    required this.id,
    required this.province,
    required this.region,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.spotType,
    this.accessNotes,
    required this.targetSpecies,
    required this.isMpa,
    this.mpaName,
    required this.isNoTake,
    required this.safetyFlags,
    required this.createdAt,
  });

  factory FishingSpotDto.fromJson(Map<String, dynamic> json) {
    return FishingSpotDto(
      id: json['id'] as String,
      province: json['province'] as String,
      region: json['region'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      spotType: json['spot_type'] as String,
      accessNotes: json['access_notes'] as String?,
      targetSpecies: (json['target_species'] as List)
          .map((species) => species as String)
          .toList(),
      isMpa: json['is_mpa'] as bool,
      mpaName: json['mpa_name'] as String?,
      isNoTake: json['is_no_take'] as bool,
      safetyFlags: (json['safety_flags'] as List)
          .map((flag) => flag as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
