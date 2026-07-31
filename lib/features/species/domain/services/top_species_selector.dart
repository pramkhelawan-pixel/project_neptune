import '../entities/daily_species_recommendation.dart';
import '../entities/species_recommendation.dart';

/// Returns Neptune's highest-ranked species.
class TopSpeciesSelector {
  const TopSpeciesSelector();

  SpeciesRecommendation select(
      DailySpeciesRecommendation recommendation,
      ) {
    return recommendation.best;
  }
}