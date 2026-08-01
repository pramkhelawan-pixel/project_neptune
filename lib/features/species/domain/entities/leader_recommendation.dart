/// Recommended leader setup.
class LeaderRecommendation {
  final String material;

  final String breakingStrain;

  const LeaderRecommendation({
    required this.material,
    required this.breakingStrain,
  });

  @override
  String toString() =>
      '$breakingStrain $material';
}