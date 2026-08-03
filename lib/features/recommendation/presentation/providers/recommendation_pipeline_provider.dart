import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/recommendation_pipeline.dart';

final recommendationPipelineProvider =
Provider<RecommendationPipeline>(
      (ref) => RecommendationPipeline(),
);