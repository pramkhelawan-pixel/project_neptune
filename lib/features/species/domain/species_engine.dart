import '../../marine/domain/models/marine_conditions.dart';
import '../data/shad_profile.dart';
import 'species_recommendation.dart';

class SpeciesEngine {
  const SpeciesEngine();

  SpeciesRecommendation recommend(
      MarineConditions conditions,
      ) {
    int score = 0;

    final reasons = <String>[];

    //--------------------------------
    // Tide
    //--------------------------------

    if (shadProfile.preferredTides
        .contains(conditions.tideState)) {
      score += 30;

      reasons.add(
        'Current tide matches Shad feeding behaviour.',
      );
    }

    //--------------------------------
    // Wind Direction
    //--------------------------------

    if (shadProfile.preferredWindDirections
        .contains(conditions.windDirection)) {
      score += 20;

      reasons.add(
        'Wind direction is favourable.',
      );
    }

    //--------------------------------
    // Wind Speed
    //--------------------------------

    if (conditions.windSpeed >=
        shadProfile.minWindSpeed &&
        conditions.windSpeed <=
            shadProfile.maxWindSpeed) {
      score += 15;

      reasons.add(
        'Wind speed is within the preferred range.',
      );
    }

    //--------------------------------
    // Swell
    //--------------------------------

    if (conditions.swellHeight >=
        shadProfile.minSwellHeight &&
        conditions.swellHeight <=
            shadProfile.maxSwellHeight) {
      score += 20;

      reasons.add(
        'Swell height is favourable.',
      );
    }

    //--------------------------------
    // Moon
    //--------------------------------

    if (shadProfile.preferredMoonPhases
        .contains(conditions.moonPhase)) {
      score += 15;

      reasons.add(
        'Moon phase supports Shad activity.',
      );
    }

    if (score > 100) {
      score = 100;
    }

    return SpeciesRecommendation(
      species: shadProfile,
      score: score,
      reasons: reasons,
    );
  }
}