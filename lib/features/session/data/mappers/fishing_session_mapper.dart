import '../../../marine/domain/enums/tide_state.dart';
import '../../../marine/domain/models/marine_conditions.dart';
import '../../domain/entities/fishing_session.dart';
import '../models/fishing_session_dto.dart';

class FishingSessionMapper {
  const FishingSessionMapper._();

  /// Reconstructs a [FishingSession] from a persisted row.
  ///
  /// [MarineConditions] is rebuilt from the snapshot columns only — it is an
  /// approximation of the original live conditions, not a verbatim copy.
  /// A null `windSpeed` means no conditions were recorded for this session
  /// (all marine columns are written together, so it's a reliable proxy).
  static FishingSession toDomain(FishingSessionDto dto) {
    MarineConditions? marineConditions;

    if (dto.windSpeed != null) {
      final canonicalTideState = dto.tideState == null
          ? null
          : TideState.values.asNameMap()[dto.tideState];

      marineConditions = MarineConditions(
        windSpeed: dto.windSpeed!,
        windDirection: dto.windDirection!,
        swellHeight: dto.swellHeight!,
        swellPeriod: dto.swellPeriod!,
        waterTemperature: dto.waterTemperature!,
        airTemperature: dto.airTemperature!,
        atmosphericPressure: dto.atmosphericPressure!,
        tideHeight: dto.tideHeight!,
        tideState: canonicalTideState?.displayName ?? 'Unknown',
        canonicalTideState: canonicalTideState,
        nextHighTide: dto.nextHighTide,
        nextLowTide: dto.nextLowTide,
        moonPhase: dto.moonPhase!,
        sunrise: dto.sunrise!,
        sunset: dto.sunset!,
      );
    }

    return FishingSession(
      id: dto.id,
      location: dto.location,
      targetSpecies: dto.targetSpecies,
      dateTime: dto.dateTime,
      marineConditions: marineConditions,
      fishingSpotId: dto.fishingSpotId,
    );
  }

  /// Snapshots [session.marineConditions] into a row — a point-in-time
  /// copy, not a live reference. Null when conditions couldn't be fetched
  /// at save time.
  static FishingSessionDto toDto(
    FishingSession session, {
    required String userId,
  }) {
    final conditions = session.marineConditions;

    return FishingSessionDto(
      id: session.id,
      userId: userId,
      location: session.location,
      targetSpecies: session.targetSpecies,
      dateTime: session.dateTime,
      windSpeed: conditions?.windSpeed,
      windDirection: conditions?.windDirection,
      swellHeight: conditions?.swellHeight,
      swellPeriod: conditions?.swellPeriod,
      waterTemperature: conditions?.waterTemperature,
      airTemperature: conditions?.airTemperature,
      atmosphericPressure: conditions?.atmosphericPressure,
      tideHeight: conditions?.tideHeight,
      tideState: conditions?.canonicalTideState?.name,
      nextHighTide: conditions?.nextHighTide,
      nextLowTide: conditions?.nextLowTide,
      moonPhase: conditions?.moonPhase,
      sunrise: conditions?.sunrise,
      sunset: conditions?.sunset,
      fishingSpotId: session.fishingSpotId,
    );
  }
}
