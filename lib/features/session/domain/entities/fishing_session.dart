import '../../../marine/domain/models/marine_conditions.dart';

class FishingSession {
  final String id;
  final String location;
  final String targetSpecies;
  final DateTime dateTime;

  /// Null when conditions couldn't be fetched at save time (e.g. WorldTides
  /// outage) — a session is still valid without them, see log_catch_controller.
  final MarineConditions? marineConditions;

  const FishingSession({
    required this.id,
    required this.location,
    required this.targetSpecies,
    required this.dateTime,
    this.marineConditions,
  });

  FishingSession copyWith({
    String? id,
    String? location,
    String? targetSpecies,
    DateTime? dateTime,
    MarineConditions? marineConditions,
  }) {
    return FishingSession(
      id: id ?? this.id,
      location: location ?? this.location,
      targetSpecies: targetSpecies ?? this.targetSpecies,
      dateTime: dateTime ?? this.dateTime,
      marineConditions: marineConditions ?? this.marineConditions,
    );
  }
}