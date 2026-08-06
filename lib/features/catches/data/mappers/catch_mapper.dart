import '../../domain/entities/catch_record.dart';
import '../models/catch_dto.dart';

class CatchMapper {
  const CatchMapper._();

  static CatchRecord toDomain(CatchDto dto) {
    return CatchRecord(
      id: dto.id,
      sessionId: dto.sessionId,
      dateTime: dto.dateTime,
      species: dto.species,
      location: dto.location,
      weightKg: dto.weightKg,
      lengthCm: dto.lengthCm,
      bait: dto.bait,
      hook: dto.hook,
      trace: dto.trace,
      notes: dto.notes,
      photoPath: dto.photoPath,
    );
  }

  static CatchDto toDto(
    CatchRecord record, {
    required String userId,
  }) {
    return CatchDto(
      id: record.id,
      userId: userId,
      sessionId: record.sessionId,
      dateTime: record.dateTime,
      species: record.species,
      location: record.location,
      weightKg: record.weightKg,
      lengthCm: record.lengthCm,
      bait: record.bait,
      hook: record.hook,
      trace: record.trace,
      notes: record.notes,
      photoPath: record.photoPath,
    );
  }
}
