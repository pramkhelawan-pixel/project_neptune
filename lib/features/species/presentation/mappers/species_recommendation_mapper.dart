import '../../domain/entities/species_recommendation.dart';

import '../models/species_recommendation_view_model.dart';

/// Maps domain entities into presentation models.
class SpeciesRecommendationMapper {
  const SpeciesRecommendationMapper();

  SpeciesRecommendationViewModel map(
      SpeciesRecommendation recommendation,
      ) {
    return SpeciesRecommendationViewModel.fromDomain(
      recommendation,
    );
  }
}