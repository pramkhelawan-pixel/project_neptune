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

  RecommendationResponse execute(
      RecommendationRequest request,
      ) {
    final seed = _seedProvider.getSeed(request);

    final recommendation = _recommendationEngine.build(
      species: request.species,
      bait: seed.bait,
      location: request.location,
      bestTime: seed.bestTime,
      weights: seed.weights,
      reasons: seed.reasons,
    );

    return RecommendationResponse(
      species: recommendation.species,
      bait: recommendation.bait,
      location: recommendation.location,
      bestTime: recommendation.bestTime,
      confidence: recommendation.confidence,
      explanations: recommendation.reasons,
    );
  }
}