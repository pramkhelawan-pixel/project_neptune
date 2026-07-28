import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../knowledge/presentation/providers/knowledge_provider.dart';
import '../../../session/presentation/providers/fishing_session_provider.dart';
import '../../domain/recommendation_request.dart';
import '../../domain/recommendation_response.dart';
import '../../services/confidence_engine.dart';
import '../../services/recommendation_engine.dart';
import '../../services/recommendation_pipeline.dart';
import '../../services/recommendation_seed_provider.dart';
import '../../services/score_engine.dart';

final recommendationSeedProvider =
Provider<RecommendationSeedProvider>(
      (ref) => RecommendationSeedProvider(
    knowledgeService: ref.watch(
      knowledgeServiceProvider,
    ),
  ),
);

final recommendationEngineProvider =
Provider<RecommendationEngine>(
      (ref) => RecommendationEngine(
    scoreEngine: const ScoreEngine(),
    confidenceEngine: const ConfidenceEngine(),
  ),
);

final recommendationPipelineProvider =
Provider<RecommendationPipeline>(
      (ref) => RecommendationPipeline(
    recommendationEngine:
    ref.watch(recommendationEngineProvider),
    seedProvider:
    ref.watch(recommendationSeedProvider),
  ),
);

final recommendationProvider =
FutureProvider<RecommendationResponse>(
      (ref) async {
    final session =
    await ref.watch(fishingSessionProvider.future);

    final pipeline =
    ref.watch(recommendationPipelineProvider);

    return pipeline.execute(
      RecommendationRequest(
        marineConditions: session.marineConditions,
        species: session.targetSpecies,
        location: session.location,
      ),
    );
  },
);