import '../entities/fishing_session.dart';

abstract class FishingSessionRepository {
  const FishingSessionRepository();

  /// Returns every logged fishing session.
  Future<List<FishingSession>> getAll();

  /// Returns a single fishing session, or null if it doesn't exist.
  Future<FishingSession?> getById(
    String id,
  );

  /// Saves a fishing session, snapshotting its marine conditions
  /// at the time of the call.
  Future<void> save(
    FishingSession session,
  );

  /// Deletes a fishing session.
  Future<void> delete(
    String id,
  );
}
