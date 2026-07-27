import 'species.dart';

class SpeciesRecommendation {
  final Species species;

  final int score;

  final List<String> reasons;

  const SpeciesRecommendation({
    required this.species,
    required this.score,
    required this.reasons,
  });
}