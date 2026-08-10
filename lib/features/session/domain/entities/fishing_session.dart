import '../../../marine/domain/models/marine_conditions.dart';

class FishingSession {
  final String id;
  final String location;
  final String targetSpecies;
  final DateTime dateTime;

  /// Null when conditions couldn't be fetched at save time (e.g. WorldTides
  /// outage) — a session is still valid without them, see log_catch_controller.
  final MarineConditions? marineConditions;

  /// Links to the fishing_spots directory entry, if the location was picked
  /// from the catalog rather than typed as free text ("Other").
  final String? fishingSpotId;

  const FishingSession({
    required this.id,
    required this.location,
    required this.targetSpecies,
    required this.dateTime,
    this.marineConditions,
    this.fishingSpotId,
  });

  FishingSession copyWith({
    String? id,
    String? location,
    String? targetSpecies,
    DateTime? dateTime,
    MarineConditions? marineConditions,
    String? fishingSpotId,
  }) {
    return FishingSession(
      id: id ?? this.id,
      location: location ?? this.location,
      targetSpecies: targetSpecies ?? this.targetSpecies,
      dateTime: dateTime ?? this.dateTime,
      marineConditions: marineConditions ?? this.marineConditions,
      fishingSpotId: fishingSpotId ?? this.fishingSpotId,
    );
  }
}