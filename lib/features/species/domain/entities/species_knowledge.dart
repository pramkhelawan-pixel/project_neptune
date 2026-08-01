import 'fish_species.dart';
import 'species_characteristics.dart';
import 'species_conservation.dart';
import 'species_profile.dart';
import 'species_size_class.dart';

/// Complete knowledge record for a South African species.
///
/// This entity represents Neptune's growing biological,
/// environmental and angling intelligence.
class SpeciesKnowledge {
  final FishSpecies species;

  final SpeciesProfile profile;

  final SpeciesCharacteristics characteristics;

  final SpeciesSizeClass sizeClass;

  final SpeciesConservation conservation;

  const SpeciesKnowledge({
    required this.species,
    required this.profile,
    required this.characteristics,
    required this.sizeClass,
    required this.conservation,
  });
}