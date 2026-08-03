// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_registry.dart
// Purpose:
// Central registry for all knowledge contained within Neptune.
//
// This is the ONLY place where knowledge datasets are registered.
//
// Repository implementations must obtain their knowledge from this registry
// rather than importing individual species files directly.
// -----------------------------------------------------------------------------

import '../../domain/entities/knowledge_record.dart';

// Garrick
import '../species/garrick_bait.dart';
import '../species/garrick_biology.dart';
import '../species/garrick_expert_tips.dart';
import '../species/garrick_hooks.dart';
import '../species/garrick_knowledge.dart';
import '../species/garrick_presentations.dart';

// Kob
import '../species/kob_bait.dart';
import '../species/kob_expert_tips.dart';
import '../species/kob_hooks.dart';
import '../species/kob_knowledge.dart';
import '../species/kob_leaders.dart';
import '../species/kob_presentations.dart';
import '../species/kob_species.dart';

// Shad
import '../species/shad_bait.dart';
import '../species/shad_expert_tips.dart';
import '../species/shad_hooks.dart';
import '../species/shad_knowledge.dart';
import '../species/shad_presentations.dart';
import '../species/shad_sinkers.dart';
import '../species/shad_species.dart';
import '../species/shad_trace.dart';

class KnowledgeRegistry {
  const KnowledgeRegistry();

  List<KnowledgeRecord> getAll() {
    return [
      // Garrick
      ...garrickKnowledge,
      ...garrickBiologyKnowledge,
      ...garrickBaitKnowledge,
      ...garrickHookKnowledge,
      ...garrickPresentationKnowledge,
      ...garrickExpertTipKnowledge,

      // Kob
      ...kobSpeciesKnowledge,
      ...kobKnowledge,
      ...kobBaitKnowledge,
      ...kobHookKnowledge,
      ...kobLeaderKnowledge,
      ...kobPresentationKnowledge,
      ...kobExpertTipKnowledge,

      // Shad
      ...shadKnowledge,
      ...shadSpeciesKnowledge,
      ...shadBaitKnowledge,
      ...shadHookKnowledge,
      ...shadPresentationKnowledge,
      ...shadSinkerKnowledge,
      ...shadTraceKnowledge,
      ...shadExpertTipKnowledge,
    ];
  }
}