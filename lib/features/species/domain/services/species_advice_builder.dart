import '../entities/species_advice.dart';
import '../entities/species_recommendation.dart';

import 'bait_recommendation_engine.dart';
import 'rig_recommendation_engine.dart';

/// Builds complete fishing advice for a recommended species.
class SpeciesAdviceBuilder {
  const SpeciesAdviceBuilder();

  final BaitRecommendationEngine _baitEngine =
  const BaitRecommendationEngine();

  final RigRecommendationEngine _rigEngine =
  const RigRecommendationEngine();

  SpeciesAdvice build(
      SpeciesRecommendation recommendation,
      ) {
    return SpeciesAdvice(
      species: recommendation.species,
      confidence: recommendation.score,
      bait: _baitEngine.recommend(
        recommendation.species,
      ),
      rig: _rigEngine.recommend(
        recommendation.species,
      ),
    );
  }
}