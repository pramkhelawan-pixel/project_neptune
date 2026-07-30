import '../../knowledge/domain/knowledge_category.dart';
import '../../knowledge/services/knowledge_service.dart';

import '../domain/recommendation_request.dart';

class RecommendationSeed {
  final String bait;
  final String hook;
  final String leader;
  final String presentation;
  final String bestTime;
  final List<int> weights;
  final List<String> reasons;

  const RecommendationSeed({
    required this.bait,
    required this.hook,
    required this.leader,
    required this.presentation,
    required this.bestTime,
    required this.weights,
    required this.reasons,
  });
}

class RecommendationSeedProvider {
  final KnowledgeService? knowledgeService;

  const RecommendationSeedProvider({
    this.knowledgeService,
  });

  RecommendationSeed getSeed(
      RecommendationRequest request,
      ) {
    final bait = knowledgeService?.bestKnowledge(
      species: request.species,
      category: KnowledgeCategory.bait,
    );

    final hook = knowledgeService?.bestKnowledge(
      species: request.species,
      category: KnowledgeCategory.hooks,
    );

    final leader = knowledgeService?.bestKnowledge(
      species: request.species,
      category: KnowledgeCategory.leader,
    );

    final presentation = knowledgeService?.bestKnowledge(
      species: request.species,
      category: KnowledgeCategory.presentation,
    );

    final weights = <int>[];
    final reasons = <String>[];

    // -------------------------
    // Tide
    // -------------------------

    if (request.marineConditions.tide.isNotEmpty) {
      final tide =
      request.marineConditions.tide.toLowerCase();

      if (tide.contains('incoming') ||
          tide.contains('push')) {
        weights.add(20);
        reasons.add(
          'Incoming tide favours ${request.species}.',
        );
      } else if (tide.contains('high')) {
        weights.add(15);
        reasons.add(
          'High tide provides favourable conditions.',
        );
      } else if (tide.contains('outgoing')) {
        weights.add(8);
        reasons.add(
          'Outgoing tide is less favourable.',
        );
      } else {
        weights.add(10);
      }
    }

    // -------------------------
    // Wind
    // -------------------------

    if (request.marineConditions.windDirection.isNotEmpty) {
      final wind =
      request.marineConditions.windDirection.toLowerCase();

      if (wind.contains('south west') ||
          wind.contains('southwest') ||
          wind.contains('sw')) {
        weights.add(20);
        reasons.add(
          'South-westerly wind favours surf fishing.',
        );
      } else if (wind.contains('west')) {
        weights.add(16);
        reasons.add(
          'Westerly wind is generally favourable.',
        );
      } else if (wind.contains('south')) {
        weights.add(14);
      } else if (wind.contains('north east') ||
          wind.contains('northeast') ||
          wind.contains('ne')) {
        weights.add(5);
        reasons.add(
          'North-easterly wind reduces fishing quality.',
        );
      } else {
        weights.add(10);
      }
    }

    // -------------------------
    // Swell
    // -------------------------

    final swell = request.marineConditions.swellHeight;

    if (swell >= 0.8 && swell <= 1.5) {
      weights.add(20);
      reasons.add(
        'Moderate swell creates productive surf conditions.',
      );
    } else if (swell > 1.5 && swell <= 2.2) {
      weights.add(15);
      reasons.add(
        'Slightly larger swell remains fishable.',
      );
    } else if (swell > 2.2 && swell <= 3.0) {
      weights.add(8);
      reasons.add(
        'Heavy swell reduces fishing efficiency.',
      );
    } else {
      weights.add(5);
      reasons.add(
        'Current swell conditions are not ideal.',
      );
    }

    // -------------------------
    // Moon Phase
    // -------------------------

    if (request.marineConditions.moonPhase.isNotEmpty) {
      final moon =
      request.marineConditions.moonPhase.toLowerCase();

      if (moon.contains('new')) {
        weights.add(20);
        reasons.add(
          'New moon often improves feeding activity.',
        );
      } else if (moon.contains('full')) {
        weights.add(18);
        reasons.add(
          'Full moon provides favourable fishing conditions.',
        );
      } else if (moon.contains('first quarter') ||
          moon.contains('last quarter')) {
        weights.add(14);
      } else {
        weights.add(10);
      }
    }

    return RecommendationSeed(
      bait: bait?.title ?? 'No bait available',
      hook: hook?.title ?? 'No hook available',
      leader: leader?.title ?? 'No leader available',
      presentation:
      presentation?.title ??
          'No presentation available',
      bestTime: 'Sunrise',
      weights: weights,
      reasons: reasons,
    );
  }
}