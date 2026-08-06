import '../../marine/domain/models/marine_conditions.dart';
import '../domain/species_environment_profile.dart';

class EnvironmentalEvaluation {
  final int score;
  final List<String> reasons;

  const EnvironmentalEvaluation({
    required this.score,
    required this.reasons,
  });
}

class EnvironmentalEvaluator {
  const EnvironmentalEvaluator();

  EnvironmentalEvaluation evaluate({
    required SpeciesEnvironmentProfile profile,
    required MarineConditions conditions,
  }) {
    var score = 0;
    final reasons = <String>[];

    // Water temperature
    if (conditions.waterTemperature >=
        profile.minimumWaterTemperature &&
        conditions.waterTemperature <=
            profile.maximumWaterTemperature) {
      score += 20;
      reasons.add(
        'Water temperature is within the preferred range.',
      );
    }

    // Swell
    if (conditions.swellHeight >=
        profile.minimumSwellHeight &&
        conditions.swellHeight <=
            profile.maximumSwellHeight) {
      score += 20;
      reasons.add(
        'Swell height is favourable.',
      );
    }

    // Tide
    final tideName = conditions.canonicalTideState?.name;

    if (tideName != null &&
        profile.preferredTides.any(
              (tide) => tide.toLowerCase() == tideName,
        )) {
      score += 20;
      reasons.add(
        'Tide matches preferred conditions.',
      );
    }

    // Wind
    if (profile.preferredWindDirections.any(
          (wind) =>
      conditions.windDirection.toLowerCase() ==
          wind.toLowerCase(),
    )) {
      score += 20;
      reasons.add(
        'Wind direction is favourable.',
      );
    }

    // Moon
    if (profile.preferredMoonPhases.any(
          (moon) =>
      conditions.moonPhase.toLowerCase() ==
          moon.toLowerCase(),
    )) {
      score += 20;
      reasons.add(
        'Moon phase supports feeding activity.',
      );
    }

    return EnvironmentalEvaluation(
      score: score,
      reasons: reasons,
    );
  }
}