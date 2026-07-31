import '../../../marine/domain/models/marine_conditions.dart';

import '../entities/fish_species.dart';
import '../entities/species_profile.dart';
import '../entities/species_recommendation.dart';

import 'species_recommendation_engine.dart';

/// Produces a ranked list of species recommendations.
class DailySpeciesRanker {
  const DailySpeciesRanker();

  final SpeciesRecommendationEngine _engine =
  const SpeciesRecommendationEngine();

  List<SpeciesRecommendation> rank({
    required MarineConditions marine,
    required List<FishSpecies> species,
    required List<SpeciesProfile> profiles,
  }) {
    assert(
    species.length == profiles.length,
    'Species and profiles must have matching lengths.',
    );

    final recommendations = <SpeciesRecommendation>[];

    for (int i = 0; i < species.length; i++) {
      recommendations.add(
        _engine.evaluate(
          species: species[i],
          profile: profiles[i],
          marine: marine,
        ),
      );
    }

    recommendations.sort(
          (a, b) => b.score.compareTo(a.score),
    );

    return recommendations;
  }
}