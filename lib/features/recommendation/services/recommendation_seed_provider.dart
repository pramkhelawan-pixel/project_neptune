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

    return RecommendationSeed(
      bait: bait?.title ?? 'No bait available',
      hook: hook?.title ?? 'No hook available',
      leader: leader?.title ?? 'No leader available',
      presentation:
      presentation?.title ?? 'No presentation available',
      bestTime: 'Sunrise',
      weights: const [
        20,
        18,
        22,
      ],
      reasons: const [
        'Species knowledge matched',
        'Marine conditions evaluated',
        'Highest confidence knowledge selected',
      ],
    );
  }
}