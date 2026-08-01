import 'species_activity.dart';
import 'species_difficulty.dart';
import 'species_habitat.dart';
import 'species_rating.dart';
import 'species_season.dart';

/// Describes a species beyond environmental conditions.
///
/// This entity represents Neptune's growing biological and angling
/// knowledge base.
class SpeciesCharacteristics {
  final List<SpeciesHabitat> habitats;

  final List<SpeciesSeason> seasons;

  final List<SpeciesActivity> activities;

  final SpeciesDifficulty difficulty;

  final SpeciesRating fightRating;

  final SpeciesRating eatingQuality;

  const SpeciesCharacteristics({
    required this.habitats,
    required this.seasons,
    required this.activities,
    required this.difficulty,
    required this.fightRating,
    required this.eatingQuality,
  });
}