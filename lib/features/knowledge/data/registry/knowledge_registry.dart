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

// Bronze Bream
import '../species/bronze_bream_bait.dart';
import '../species/bronze_bream_expert_tips.dart';
import '../species/bronze_bream_hooks.dart';
import '../species/bronze_bream_knowledge.dart';
import '../species/bronze_bream_presentations.dart';

// Blacktail
import '../species/blacktail_bait.dart';
import '../species/blacktail_expert_tips.dart';
import '../species/blacktail_hooks.dart';
import '../species/blacktail_knowledge.dart';
import '../species/blacktail_presentations.dart';

// Stumpnose
import '../species/stumpnose_bait.dart';
import '../species/stumpnose_expert_tips.dart';
import '../species/stumpnose_hooks.dart';
import '../species/stumpnose_knowledge.dart';
import '../species/stumpnose_presentations.dart';

// Galjoen
import '../species/galjoen_bait.dart';
import '../species/galjoen_expert_tips.dart';
import '../species/galjoen_hooks.dart';
import '../species/galjoen_knowledge.dart';
import '../species/galjoen_presentations.dart';

// Grunter
import '../species/grunter_bait.dart';
import '../species/grunter_expert_tips.dart';
import '../species/grunter_hooks.dart';
import '../species/grunter_knowledge.dart';
import '../species/grunter_presentations.dart';

// White Steenbras
import '../species/white_steenbras_bait.dart';
import '../species/white_steenbras_expert_tips.dart';
import '../species/white_steenbras_hooks.dart';
import '../species/white_steenbras_knowledge.dart';
import '../species/white_steenbras_presentations.dart';

// Black Musselcracker
import '../species/black_musselcracker_bait.dart';
import '../species/black_musselcracker_expert_tips.dart';
import '../species/black_musselcracker_hooks.dart';
import '../species/black_musselcracker_knowledge.dart';
import '../species/black_musselcracker_presentations.dart';

// Zebra
import '../species/zebra_bait.dart';
import '../species/zebra_expert_tips.dart';
import '../species/zebra_hooks.dart';
import '../species/zebra_knowledge.dart';
import '../species/zebra_presentations.dart';

// Karanteen
import '../species/karanteen_bait.dart';
import '../species/karanteen_expert_tips.dart';
import '../species/karanteen_hooks.dart';
import '../species/karanteen_knowledge.dart';
import '../species/karanteen_presentations.dart';

// Springer
import '../species/springer_bait.dart';
import '../species/springer_expert_tips.dart';
import '../species/springer_hooks.dart';
import '../species/springer_knowledge.dart';
import '../species/springer_presentations.dart';

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

      // Bronze Bream
      ...bronzeBreamKnowledge,
      ...bronzeBreamBaitKnowledge,
      ...bronzeBreamHookKnowledge,
      ...bronzeBreamPresentationKnowledge,
      ...bronzeBreamExpertTipKnowledge,

      // Blacktail
      ...blacktailKnowledge,
      ...blacktailBaitKnowledge,
      ...blacktailHookKnowledge,
      ...blacktailPresentationKnowledge,
      ...blacktailExpertTipKnowledge,

      // Stumpnose
      ...stumpnoseKnowledge,
      ...stumpnoseBaitKnowledge,
      ...stumpnoseHookKnowledge,
      ...stumpnosePresentationKnowledge,
      ...stumpnoseExpertTipKnowledge,

      // Galjoen
      ...galjoenKnowledge,
      ...galjoenBaitKnowledge,
      ...galjoenHookKnowledge,
      ...galjoenPresentationKnowledge,
      ...galjoenExpertTipKnowledge,

      // Grunter
      ...grunterKnowledge,
      ...grunterBaitKnowledge,
      ...grunterHookKnowledge,
      ...grunterPresentationKnowledge,
      ...grunterExpertTipKnowledge,

      // White Steenbras
      ...whiteSteenbrasKnowledge,
      ...whiteSteenbrasBaitKnowledge,
      ...whiteSteenbrasHookKnowledge,
      ...whiteSteenbrasPresentationKnowledge,
      ...whiteSteenbrasExpertTipKnowledge,

      // Black Musselcracker
      ...blackMusselcrackerKnowledge,
      ...blackMusselcrackerBaitKnowledge,
      ...blackMusselcrackerHookKnowledge,
      ...blackMusselcrackerPresentationKnowledge,
      ...blackMusselcrackerExpertTipKnowledge,

      // Zebra
      ...zebraKnowledge,
      ...zebraBaitKnowledge,
      ...zebraHookKnowledge,
      ...zebraPresentationKnowledge,
      ...zebraExpertTipKnowledge,

      // Karanteen
      ...karanteenKnowledge,
      ...karanteenBaitKnowledge,
      ...karanteenHookKnowledge,
      ...karanteenPresentationKnowledge,
      ...karanteenExpertTipKnowledge,

      // Springer
      ...springerKnowledge,
      ...springerBaitKnowledge,
      ...springerHookKnowledge,
      ...springerPresentationKnowledge,
      ...springerExpertTipKnowledge,
    ];
  }
}