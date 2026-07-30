import '../domain/environmental_readiness.dart';

class EnvironmentalReadinessCalculator {
  const EnvironmentalReadinessCalculator();

  EnvironmentalReadiness calculate({
    required int environmentalScore,
    required List<String> reasons,
  }) {
    final strengths = <String>[];
    final weaknesses = <String>[];

    for (final reason in reasons) {
      if (reason.contains('ideal') ||
          reason.contains('favourable') ||
          reason.contains('supports') ||
          reason.contains('preferred')) {
        strengths.add(reason);
      } else {
        weaknesses.add(reason);
      }
    }

    return EnvironmentalReadiness(
      score: environmentalScore,
      level: _level(environmentalScore),
      strengths: strengths,
      weaknesses: weaknesses,
    );
  }

  String _level(int score) {
    if (score >= 90) return 'Excellent';
    if (score >= 75) return 'Very Good';
    if (score >= 60) return 'Good';
    if (score >= 45) return 'Fair';
    if (score >= 30) return 'Poor';
    return 'Very Poor';
  }
}