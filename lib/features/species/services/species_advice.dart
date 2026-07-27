class SpeciesAdvice {
  final String species;
  final String bait;
  final String bestTime;
  final List<int> weights;
  final List<String> reasons;

  const SpeciesAdvice({
    required this.species,
    required this.bait,
    required this.bestTime,
    required this.weights,
    required this.reasons,
  });
}