import '../../domain/entities/fishing_spot.dart';
import '../models/fishing_spot_dto.dart';

class FishingSpotMapper {
  const FishingSpotMapper._();

  static FishingSpot toDomain(FishingSpotDto dto) {
    return FishingSpot(
      id: dto.id,
      province: dto.province,
      region: dto.region,
      name: dto.name,
      latitude: dto.latitude,
      longitude: dto.longitude,
      spotType: dto.spotType,
      accessNotes: dto.accessNotes,
      targetSpecies: dto.targetSpecies,
      isMpa: dto.isMpa,
      mpaName: dto.mpaName,
      isNoTake: dto.isNoTake,
      safetyFlags: dto.safetyFlags,
      createdAt: dto.createdAt,
    );
  }
}
