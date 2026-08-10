import '../entities/fishing_spot.dart';

abstract class FishingSpotRepository {
  const FishingSpotRepository();

  /// Returns every spot in the directory.
  Future<List<FishingSpot>> getAll();

  /// Returns a single spot, or null if it doesn't exist.
  Future<FishingSpot?> getById(
    String id,
  );

  /// Returns all spots in a province.
  Future<List<FishingSpot>> getByProvince(
    String province,
  );

  /// Returns all spots that list the given species as a target.
  Future<List<FishingSpot>> getBySpecies(
    String species,
  );
}
