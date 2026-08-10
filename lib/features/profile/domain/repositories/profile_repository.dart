import '../entities/profile.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  /// Returns the signed-in user's profile, or null if they don't have
  /// one yet (e.g. backfill hasn't run for their account).
  Future<Profile?> getCurrentProfile();
}
