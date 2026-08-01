import '../domain/entities/species_activity.dart';
import '../domain/entities/species_characteristics.dart';
import '../domain/entities/species_difficulty.dart';
import '../domain/entities/species_habitat.dart';
import '../domain/entities/species_rating.dart';
import '../domain/entities/species_season.dart';

const SpeciesCharacteristics galjoenCharacteristics =
SpeciesCharacteristics(
  habitats: [
    SpeciesHabitat.surf,
    SpeciesHabitat.reef,
  ],
  seasons: [
    SpeciesSeason.winter,
    SpeciesSeason.spring,
  ],
  activities: [
    SpeciesActivity.dawn,
    SpeciesActivity.dusk,
  ],
  difficulty: SpeciesDifficulty.intermediate,
  fightRating: SpeciesRating.four,
  eatingQuality: SpeciesRating.five,
);