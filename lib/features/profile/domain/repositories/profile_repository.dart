import '../entities/profile.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  /// Returns the signed-in user's profile, or null if they don't have
  /// one yet (e.g. backfill hasn't run for their account).
  Future<Profile?> getCurrentProfile();

  /// Permanently deletes the signed-in user's Neptune account and all of
  /// their data (catches, fishing sessions, profile). Does not sign the
  /// user out locally -- callers must do that themselves once this
  /// succeeds, since the server-side account is already gone by then.
  Future<void> deleteAccount();
}
