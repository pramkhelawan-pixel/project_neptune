import '../../domain/knowledge_record.dart';

import 'kob_bait.dart';
import 'kob_expert_tips.dart';
import 'kob_hooks.dart';
import 'kob_leaders.dart';
import 'kob_presentations.dart';
import 'kob_species.dart';

/// Complete Neptune knowledge library for Dusky Kob.
///
/// This file acts as the single entry point for all Kob-related
/// knowledge within Neptune. It intentionally contains no
/// KnowledgeRecord definitions itself.
///
/// Instead, it aggregates the specialised knowledge modules into
/// one collection that can be consumed by:
///
/// • Species Explorer
/// • Recommendation Engine
/// • Search
/// • AI Intelligence
/// • Future API endpoints
///
/// New Kob knowledge should always be added to its specialised
/// module (bait, hooks, leaders, etc.) and will automatically
/// become available through this library.
final List<KnowledgeRecord> kobKnowledge = [
  ...kobSpeciesKnowledge,
  ...kobBaitKnowledge,
  ...kobHookKnowledge,
  ...kobLeaderKnowledge,
  ...kobPresentationKnowledge,
  ...kobExpertTipKnowledge,
];

/// Total number of Kob knowledge records.
final int kobKnowledgeCount = kobKnowledge.length;