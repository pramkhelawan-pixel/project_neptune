import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/species_knowledge_repository_impl.dart';
import '../../domain/entities/species_knowledge.dart';
import '../../domain/repositories/species_knowledge_repository.dart';

/// Temporary provider.
///
/// This will later source its data from Supabase or another
/// persistent store.
final speciesKnowledgeRepositoryProvider =
Provider<SpeciesKnowledgeRepository>(
      (ref) {
    return const SpeciesKnowledgeRepositoryImpl(
      knowledge: <SpeciesKnowledge>[],
    );
  },
);