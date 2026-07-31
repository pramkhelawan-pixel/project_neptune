import '../entities/fish_species.dart';
import '../entities/species_profile.dart';
import '../entities/species_recommendation.dart';
import 'species_matcher.dart';

import '../../../marine/domain/models/marine_conditions.dart';

/// Generates recommendations for individual fish species.
class SpeciesRecommendationEngine {
  final SpeciesMatcher _matcher = const SpeciesMatcher();

  const SpeciesRecommendationEngine();

  SpeciesRecommendation evaluate({
    required FishSpecies species,
    required SpeciesProfile profile,
    required MarineConditions marine,
  }) {
    final score = _matcher.calculateScore(
      marine: marine,
      profile: profile,
    );

    return SpeciesRecommendation(
      species: species,
      score: score,
      recommended: score >= 70,
    );
  }
}