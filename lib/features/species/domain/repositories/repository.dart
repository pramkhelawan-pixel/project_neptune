// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: repository.dart
// Purpose:
// Contract for retrieving Species domain models.
// -----------------------------------------------------------------------------

import '../species.dart';

abstract class SpeciesRepository {
  /// Returns all supported species.
  Future<List<Species>> getAllSpecies();

  /// Returns a species by its unique ID.
  Future<Species?> getById(String id);

  /// Returns a species by its common name.
  Future<Species?> getByName(String name);

  /// Searches species by text.
  Future<List<Species>> search(String query);
}