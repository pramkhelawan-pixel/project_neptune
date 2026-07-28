import '../../knowledge/domain/services/knowledge_service.dart';
import '../domain/recommendation_request.dart';

class RecommendationSeed {
  final String bait;
  final String bestTime;
  final List<int> weights;
  final List<String> reasons;

  const RecommendationSeed({
    required this.bait,
    required this.bestTime,
    required this.weights,
    required this.reasons,
  });
}

class RecommendationSeedProvider {
  final KnowledgeService knowledgeService;

  const RecommendationSeedProvider({
    required this.knowledgeService,
  });

  RecommendationSeed getSeed(
      RecommendationRequest request,
      ) {
    // MVP implementation.
    // The Knowledge Service is injected and will be used in future sprints
    // once the Knowledge Repository contains production fishing knowledge.

    return const RecommendationSeed(
      bait: 'Fresh Sardine',
      bestTime: 'Sunrise',
      weights: [
        15,
        20,
        18,
      ],
      reasons: [
        'Incoming tide',
        'Moderate swell',
        'Light offshore wind',
      ],
    );
  }
}