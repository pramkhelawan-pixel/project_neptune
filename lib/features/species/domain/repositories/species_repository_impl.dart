// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: species_repository_impl.dart
// Purpose:
// Default implementation of the Species Repository.
//
// During the MVP, species data will be stored as Dart constants.
// Future implementations may load data from SQLite, Supabase,
// offline knowledge packs or cloud APIs.
// -----------------------------------------------------------------------------

import '../species.dart';
import 'repository.dart';

class SpeciesRepositoryImpl implements SpeciesRepository {
  const SpeciesRepositoryImpl();

  @override
  Future<List<Species>> getAllSpecies() async {
    return const [];
  }

  @override
  Future<Species?> getById(
      String id,
      ) async {
    return null;
  }

  @override
  Future<Species?> getByName(
      String name,
      ) async {
    return null;
  }

  @override
  Future<List<Species>> search(
      String query,
      ) async {
    return const [];
  }
}