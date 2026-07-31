import '../entities/species_recommendation.dart';

/// Formats recommendation scores for presentation.
class SpeciesScoreFormatter {
  const SpeciesScoreFormatter();

  String format(
      SpeciesRecommendation recommendation,
      ) {
    return '${recommendation.species.commonName} '
        '- ${recommendation.score}%';
  }
}