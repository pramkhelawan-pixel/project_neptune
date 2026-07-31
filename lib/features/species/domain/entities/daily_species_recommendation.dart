import 'species_recommendation.dart';

/// Represents Neptune's daily species recommendations.
class DailySpeciesRecommendation {
  /// Ranked recommendations.
  final List<SpeciesRecommendation> recommendations;

  const DailySpeciesRecommendation({
    required this.recommendations,
  });

  /// Best recommendation.
  SpeciesRecommendation get best =>
      recommendations.first;

  /// Returns true when recommendations exist.
  bool get hasRecommendations =>
      recommendations.isNotEmpty;

  /// Top three recommendations.
  List<SpeciesRecommendation> get topThree {
    if (recommendations.length <= 3) {
      return recommendations;
    }

    return recommendations.take(3).toList();
  }
}