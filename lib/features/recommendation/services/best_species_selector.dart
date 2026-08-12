import '../../marine/domain/models/marine_conditions.dart';

import '../data/species_environment_profiles.dart';
import '../domain/species_environment_profile.dart';

import 'environmental_evaluator.dart';

class SpeciesEvaluationResult {
  final String species;
  final int score;
  final List<String> reasons;

  const SpeciesEvaluationResult({
    required this.species,
    required this.score,
    required this.reasons,
  });
}

class BestSpeciesSelector {
  const BestSpeciesSelector({
    this.environmentalEvaluator = const EnvironmentalEvaluator(),
  });

  final EnvironmentalEvaluator environmentalEvaluator;

  SpeciesEvaluationResult selectBest({
    required MarineConditions conditions,
    List<SpeciesEnvironmentProfile> profiles = environmentProfiles,
  }) {
    SpeciesEvaluationResult? best;

    for (final profile in profiles) {
      final evaluation = environmentalEvaluator.evaluate(
        profile: profile,
        conditions: conditions,
      );

      if (best == null || evaluation.score > best.score) {
        best = SpeciesEvaluationResult(
          species: profile.species,
          score: evaluation.score,
          reasons: evaluation.reasons,
        );
      }
    }

    return best!;
  }
}
