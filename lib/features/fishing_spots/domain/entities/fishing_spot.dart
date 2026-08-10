class FishingSpot {
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

  const FishingSpot({
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
}
