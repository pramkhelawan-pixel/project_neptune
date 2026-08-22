import '../domain/recommendation_request.dart';
import '../domain/recommendation_response.dart';

import 'confidence_engine.dart';
import 'recommendation_engine.dart';
import 'recommendation_seed_provider.dart';
import 'score_engine.dart';

class RecommendationPipeline {
  RecommendationPipeline({
    RecommendationEngine? recommendationEngine,
    RecommendationSeedProvider? seedProvider,
  })  : _recommendationEngine =
      recommendationEngine ??
          RecommendationEngine(
            scoreEngine: const ScoreEngine(),
            confidenceEngine: const ConfidenceEngine(),
          ),
        _seedProvider =
            seedProvider ?? const RecommendationSeedProvider();

  final RecommendationEngine _recommendationEngine;
  final RecommendationSeedProvider _seedProvider;

  Future<RecommendationResponse> execute(
      RecommendationRequest request,
      ) async {
    final seed = await _seedProvider.getSeed(request);

    final recommendation = _recommendationEngine.build(
      species: request.species,
      bait: seed.bait,
      location: request.location,
      bestTime: seed.bestTime,
      environmentalScore: seed.environmentalScore,
      reasons: seed.reasons,
    );

    return RecommendationResponse(
      species: recommendation.species,
      bait: seed.bait,
      hook: seed.hook,
      leader: seed.leader,
      presentation: seed.presentation,
      location: recommendation.location,
      bestTime: recommendation.bestTime,
      confidence: recommendation.confidence.toDouble(),
      explanations: recommendation.reasons,
    );
  }
}