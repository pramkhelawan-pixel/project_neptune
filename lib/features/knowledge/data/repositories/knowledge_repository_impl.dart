import '../../domain/knowledge_record.dart';
import '../../repositories/knowledge_repository.dart';

import '../species/kob_bait.dart';
import '../species/kob_expert_tips.dart';
import '../species/kob_hooks.dart';
import '../species/kob_leaders.dart';
import '../species/kob_presentations.dart';
import '../species/kob_species.dart';

import '../species/shad_bait.dart';
import '../species/shad_expert_tips.dart';
import '../species/shad_hooks.dart';
import '../species/shad_knowledge.dart';
import '../species/shad_presentations.dart';
import '../species/shad_sinkers.dart';
import '../species/shad_species.dart';
import '../species/shad_trace.dart';

class KnowledgeRepositoryImpl implements KnowledgeRepository {
  const KnowledgeRepositoryImpl();

  @override
  List<KnowledgeRecord> all() {
    return [
      // Shad
      ...shadKnowledge,
      ...shadSpeciesKnowledge,
      ...shadBaitKnowledge,
      ...shadHookKnowledge,
      ...shadPresentationKnowledge,
      ...shadSinkerKnowledge,
      ...shadTraceKnowledge,
      ...shadExpertTipKnowledge,

      // Dusky Kob
      ...kobSpeciesKnowledge,
      ...kobBaitKnowledge,
      ...kobHookKnowledge,
      ...kobLeaderKnowledge,
      ...kobPresentationKnowledge,
      ...kobExpertTipKnowledge,
    ];
  }

  @override
  List<KnowledgeRecord> forSpecies(
      String species,
      ) {
    return all()
        .where(
          (record) =>
      record.species.toLowerCase() ==
          species.toLowerCase(),
    )
        .toList();
  }

  @override
  List<KnowledgeRecord> byCategory(
      String species,
      String category,
      ) {
    return all()
        .where(
          (record) =>
      record.species.toLowerCase() ==
          species.toLowerCase() &&
          record.category.name.toLowerCase() ==
              category.toLowerCase(),
    )
        .toList();
  }
}