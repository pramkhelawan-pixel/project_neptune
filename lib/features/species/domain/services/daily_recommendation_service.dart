import '../../../marine/domain/models/marine_conditions.dart';

import '../../data/species_catalog.dart';
import '../../data/species_profiles.dart';

import '../entities/daily_species_recommendation.dart';

import 'daily_species_ranker.dart';

/// Produces Neptune's daily species recommendations.
class DailyRecommendationService {
  const DailyRecommendationService();

  final DailySpeciesRanker _ranker =
  const DailySpeciesRanker();

  DailySpeciesRecommendation generate(
      MarineConditions marine,
      ) {
    final recommendations = _ranker.rank(
      marine: marine,
      species: speciesCatalog,
      profiles: speciesProfiles,
    );

    return DailySpeciesRecommendation(
      recommendations: recommendations,
    );
  }
}