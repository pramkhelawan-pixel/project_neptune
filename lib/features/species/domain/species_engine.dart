import '../../marine/domain/models/marine_conditions.dart';
import '../data/all_species_profiles.dart';
import 'species.dart';
import 'species_recommendation.dart';

/// Evaluates live marine conditions against every known species profile and
/// recommends the best match.
///
/// Shad remains Neptune's reference species; every other profile follows
/// the same knowledge standard (see ROADMAP.md).
class SpeciesEngine {
  const SpeciesEngine();

  /// Returns the single best-matching species recommendation.
  SpeciesRecommendation recommend(
      MarineConditions conditions,
      ) {
    return rank(conditions).first;
  }

  /// Returns every species recommendation, ranked best to worst.
  List<SpeciesRecommendation> rank(
      MarineConditions conditions,
      ) {
    final recommendations = allSpeciesProfiles
        .map((profile) => _evaluate(profile, conditions))
        .toList();

    recommendations.sort(
          (a, b) => b.score.compareTo(a.score),
    );

    return recommendations;
  }

  SpeciesRecommendation _evaluate(
      Species profile,
      MarineConditions conditions,
      ) {
    int score = 0;

    final reasons = <String>[];

    //--------------------------------
    // Tide
    //--------------------------------

    final tideName = conditions.canonicalTideState?.name;

    if (tideName != null &&
        profile.preferredTides
            .any((tide) => tide.toLowerCase() == tideName)) {
      score += 30;

      reasons.add(
        'Current tide matches ${profile.name} feeding behaviour.',
      );
    }

    //--------------------------------
    // Wind Direction
    //--------------------------------

    if (profile.preferredWindDirections
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
        profile.minWindSpeed &&
        conditions.windSpeed <=
            profile.maxWindSpeed) {
      score += 15;

      reasons.add(
        'Wind speed is within the preferred range.',
      );
    }

    //--------------------------------
    // Swell
    //--------------------------------

    if (conditions.swellHeight >=
        profile.minSwellHeight &&
        conditions.swellHeight <=
            profile.maxSwellHeight) {
      score += 20;

      reasons.add(
        'Swell height is favourable.',
      );
    }

    //--------------------------------
    // Moon
    //--------------------------------

    if (profile.preferredMoonPhases
        .contains(conditions.moonPhase)) {
      score += 15;

      reasons.add(
        'Moon phase supports ${profile.name} activity.',
      );
    }

    if (score > 100) {
      score = 100;
    }

    return SpeciesRecommendation(
      species: profile,
      score: score,
      reasons: reasons,
    );
  }
}