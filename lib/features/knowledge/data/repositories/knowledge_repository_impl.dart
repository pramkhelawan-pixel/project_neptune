import '../../domain/entities/knowledge_record.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';
import '../../domain/repositories/knowledge_repository.dart';

import '../registry/knowledge_registry.dart';

class KnowledgeRepositoryImpl implements KnowledgeRepository {
  const KnowledgeRepositoryImpl();

  static const KnowledgeRegistry _registry = KnowledgeRegistry();

  @override
  Future<List<KnowledgeRecord>> getAll() async {
    return _registry.getAll();
  }

  @override
  Future<KnowledgeRecord?> getById(String id) async {
    final records = _registry.getAll();

    for (final record in records) {
      if (record.id == id) {
        return record;
      }
    }

    return null;
  }

  @override
  Future<List<KnowledgeRecord>> search(String query) async {
    final search = query.toLowerCase();

    return _registry.getAll().where((record) {
      return record.title.toLowerCase().contains(search) ||
          record.description.toLowerCase().contains(search) ||
          record.tags.any(
                (tag) => tag.toLowerCase().contains(search),
          );
    }).toList();
  }

  @override
  Future<List<KnowledgeRecord>> getBySpecies(String species) async {
    return _registry
        .getAll()
        .where(
          (record) =>
      record.species?.toLowerCase() == species.toLowerCase(),
    )
        .toList();
  }

  @override
  Future<List<KnowledgeRecord>> getBySpeciesAndCategory({
    required String species,
    required KnowledgeCategory category,
  }) async {
    return _registry
        .getAll()
        .where(
          (record) =>
      record.species?.toLowerCase() == species.toLowerCase() &&
          record.category == category,
    )
        .toList();
  }

  @override
  Future<KnowledgeRecord?> getBestKnowledge({
    required String species,
    required KnowledgeCategory category,
  }) async {
    final records = await getBySpeciesAndCategory(
      species: species,
      category: category,
    );

    if (records.isEmpty) {
      return null;
    }

    return records.first;
  }

  @override
  Future<List<KnowledgeRecord>> getByCategory(
      KnowledgeCategory category,
      ) async {
    return _registry
        .getAll()
        .where(
          (record) => record.category == category,
    )
        .toList();
  }

  @override
  Future<List<KnowledgeRecord>> getByEvidenceLevel(
      EvidenceLevel evidenceLevel,
      ) async {
    return _registry
        .getAll()
        .where(
          (record) => record.evidenceLevel == evidenceLevel,
    )
        .toList();
  }

  @override
  Future<List<KnowledgeRecord>> getByTags(
      List<String> tags,
      ) async {
    return _registry
        .getAll()
        .where(
          (record) =>
          tags.any((tag) => record.tags.contains(tag)),
    )
        .toList();
  }

  @override
  Future<List<KnowledgeRecord>> getByRegion(
      String region,
      ) async {
    return _registry
        .getAll()
        .where(
          (record) => record.regions.contains(region),
    )
        .toList();
  }

  @override
  Future<List<KnowledgeRecord>> getRelatedKnowledge(
      String knowledgeId,
      ) async {
    return [];
  }
}