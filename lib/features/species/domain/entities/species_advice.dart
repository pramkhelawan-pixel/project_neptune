import 'fish_species.dart';

/// Complete fishing advice for a species.
class SpeciesAdvice {
  final FishSpecies species;

  final int confidence;

  final String bait;

  final String rig;

  const SpeciesAdvice({
    required this.species,
    required this.confidence,
    required this.bait,
    required this.rig,
  });
}