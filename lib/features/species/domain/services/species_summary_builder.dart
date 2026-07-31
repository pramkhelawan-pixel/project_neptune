import '../entities/daily_species_recommendation.dart';

/// Builds a concise summary for today's recommendations.
class SpeciesSummaryBuilder {
  const SpeciesSummaryBuilder();

  String build(
      DailySpeciesRecommendation recommendation,
      ) {
    if (!recommendation.hasRecommendations) {
      return 'No species recommendations are available.';
    }

    final best = recommendation.best;

    return 'Today\'s best target species is '
        '${best.species.commonName} '
        'with a suitability score of '
        '${best.score}%.';
  }
}