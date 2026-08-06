import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../knowledge/domain/entities/knowledge_record.dart';
import '../../../knowledge/presentation/providers/knowledge_provider.dart';

/// Returns every knowledge record Neptune holds for a given species name.
final speciesKnowledgeProvider =
FutureProvider.family<List<KnowledgeRecord>, String>(
      (ref, species) async {
    final service = ref.watch(knowledgeServiceProvider);

    return service.forSpecies(species);
  },
);
