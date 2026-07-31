import '../../domain/entities/species_recommendation.dart';

/// View model used by the presentation layer.
///
/// Separates UI concerns from the domain entities.
class SpeciesRecommendationViewModel {
  final String speciesName;

  final int score;

  final bool recommended;

  const SpeciesRecommendationViewModel({
    required this.speciesName,
    required this.score,
    required this.recommended,
  });

  factory SpeciesRecommendationViewModel.fromDomain(
      SpeciesRecommendation recommendation,
      ) {
    return SpeciesRecommendationViewModel(
      speciesName: recommendation.species.commonName,
      score: recommendation.score,
      recommended: recommendation.recommended,
    );
  }
}