import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../session/presentation/providers/fishing_session_provider.dart';
import '../../domain/recommendation_request.dart';
import '../../domain/recommendation_response.dart';
import '../../services/recommendation_pipeline.dart';

final recommendationPipelineProvider =
Provider<RecommendationPipeline>(
      (ref) => RecommendationPipeline(),
);

final recommendationProvider =
FutureProvider<RecommendationResponse>((ref) async {
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
});