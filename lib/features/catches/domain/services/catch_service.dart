import '../entities/catch_record.dart';
import '../repositories/catch_repository.dart';

class CatchService {
  final CatchRepository repository;

  const CatchService({
    required this.repository,
  });

  Future<List<CatchRecord>> getAllCatches() {
    return repository.getAll();
  }

  Future<void> saveCatch(
      CatchRecord record,
      ) {
    return repository.save(record);
  }

  Future<void> deleteCatch(
      String id,
      ) {
    return repository.delete(id);
  }

  Future<List<CatchRecord>> getSpeciesHistory(
      String species,
      ) {
    return repository.getBySpecies(species);
  }

  Future<List<CatchRecord>> getLocationHistory(
      String location,
      ) {
    return repository.getByLocation(location);
  }
}