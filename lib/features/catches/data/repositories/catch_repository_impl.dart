import '../../domain/entities/catch_record.dart';
import '../../domain/repositories/catch_repository.dart';

class CatchRepositoryImpl implements CatchRepository {
  final List<CatchRecord> _records = [];

  CatchRepositoryImpl();

  @override
  Future<List<CatchRecord>> getAll() async {
    return List.unmodifiable(_records);
  }

  @override
  Future<void> save(
      CatchRecord record,
      ) async {
    _records.removeWhere(
          (r) => r.id == record.id,
    );

    _records.add(record);
  }

  @override
  Future<void> delete(
      String id,
      ) async {
    _records.removeWhere(
          (r) => r.id == id,
    );
  }

  @override
  Future<List<CatchRecord>> getBySpecies(
      String species,
      ) async {
    return _records
        .where(
          (r) =>
      r.species.toLowerCase() ==
          species.toLowerCase(),
    )
        .toList();
  }

  @override
  Future<List<CatchRecord>> getByLocation(
      String location,
      ) async {
    return _records
        .where(
          (r) =>
      r.location.toLowerCase() ==
          location.toLowerCase(),
    )
        .toList();
  }
}