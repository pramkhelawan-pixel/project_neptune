import '../../knowledge/domain/knowledge_category.dart';
import '../../knowledge/services/knowledge_service.dart';
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
  final KnowledgeService? knowledgeService;

  const RecommendationSeedProvider({
    this.knowledgeService,
  });

  RecommendationSeed getSeed(
      RecommendationRequest request,
      ) {
    final baitRecord = knowledgeService?.bestKnowledge(
      species: request.species,
      category: KnowledgeCategory.bait,
    );

    return RecommendationSeed(
      bait: baitRecord?.title ?? 'Fresh Sardine',
      bestTime: 'Sunrise',
      weights: const <int>[
        15,
        20,
        18,
      ],
      reasons: const <String>[
        'Incoming tide',
        'Moderate swell',
        'Light offshore wind',
      ],
    );
  }
}