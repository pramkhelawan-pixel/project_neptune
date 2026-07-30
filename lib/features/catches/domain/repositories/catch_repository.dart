import '../entities/catch_record.dart';

abstract class CatchRepository {
  const CatchRepository();

  /// Returns every logged catch.
  Future<List<CatchRecord>> getAll();

  /// Saves a catch.
  Future<void> save(
      CatchRecord record,
      );

  /// Deletes a catch.
  Future<void> delete(
      String id,
      );

  /// Returns all catches for a species.
  Future<List<CatchRecord>> getBySpecies(
      String species,
      );

  /// Returns all catches for a location.
  Future<List<CatchRecord>> getByLocation(
      String location,
      );
}