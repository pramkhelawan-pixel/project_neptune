import 'fish_species.dart';

/// Represents Neptune's recommendation for a specific species.
class SpeciesRecommendation {
  final FishSpecies species;

  /// Suitability score (0–100).
  final int score;

  /// Indicates whether this species is recommended today.
  final bool recommended;

  const SpeciesRecommendation({
    required this.species,
    required this.score,
    required this.recommended,
  });

  bool get isExcellent => score >= 90;

  bool get isGood => score >= 75;

  bool get isFair => score >= 55;

  bool get isPoor => score < 55;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SpeciesRecommendation &&
            species == other.species &&
            score == other.score &&
            recommended == other.recommended;
  }

  @override
  int get hashCode => Object.hash(
    species,
    score,
    recommended,
  );
}