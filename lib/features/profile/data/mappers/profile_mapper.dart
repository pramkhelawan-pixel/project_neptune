import '../../domain/entities/profile.dart';
import '../models/profile_dto.dart';

class ProfileMapper {
  const ProfileMapper._();

  static Profile toDomain(ProfileDto dto) {
    return Profile(
      id: dto.id,
      isPremium: dto.isPremium,
      createdAt: dto.createdAt,
    );
  }
}
