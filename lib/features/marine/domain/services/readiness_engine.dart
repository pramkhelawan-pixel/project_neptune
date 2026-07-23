import '../models/marine_conditions.dart';

class ReadinessEngine {
  const ReadinessEngine();

  int calculate(MarineConditions conditions) {
    var score = 0;

    if (conditions.windSpeed <= 20) {
      score += 25;
    }

    if (conditions.swellHeight <= 2.0) {
      score += 25;
    }

    if (conditions.tide == 'Rising') {
      score += 25;
    }

    if (conditions.moonPhase.contains('Waxing')) {
      score += 25;
    }

    return score;
  }
}