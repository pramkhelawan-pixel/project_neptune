import '../../marine/domain/models/marine_conditions.dart';

class ReadinessResult {
  final int score;
  final String rating;
  final String recommendation;
  final List<String> reasons;

  const ReadinessResult({
    required this.score,
    required this.rating,
    required this.recommendation,
    required this.reasons,
  });
}

class ReadinessEngine {
  const ReadinessEngine();

  ReadinessResult calculate(
      MarineConditions conditions,
      ) {
    int score = 0;

    final reasons = <String>[];

    //-----------------------------------
    // WIND
    //-----------------------------------

    if (conditions.windSpeed <= 10) {
      score += 20;
      reasons.add('Light wind');
    } else if (conditions.windSpeed <= 20) {
      score += 15;
      reasons.add('Moderate wind');
    } else {
      score += 5;
      reasons.add('Strong wind');
    }

    //-----------------------------------
    // SWELL
    //-----------------------------------

    if (conditions.swellHeight >= 1 &&
        conditions.swellHeight <= 2) {
      score += 25;
      reasons.add('Ideal swell');
    } else if (conditions.swellHeight <= 3) {
      score += 15;
      reasons.add('Fishable swell');
    } else {
      score += 5;
      reasons.add('Large swell');
    }

    //-----------------------------------
    // TIDE
    //-----------------------------------

    final tideState = conditions.canonicalTideState;

    if (tideState != null && tideState.isIncoming) {
      score += 25;
      reasons.add('Incoming tide');
    } else if (tideState != null && tideState.isHigh) {
      score += 20;
      reasons.add('High tide');
    } else if (tideState != null && tideState.isOutgoing) {
      score += 10;
      reasons.add('Outgoing tide');
    } else if (tideState != null && tideState.isLow) {
      score += 10;
      reasons.add('Low tide');
    } else {
      score += 5;
      reasons.add('Unknown tide');
    }

    //-----------------------------------
    // SCORE LIMIT
    //-----------------------------------

    if (score > 100) {
      score = 100;
    }

    //-----------------------------------
    // RATING
    //-----------------------------------

    String rating;

    String recommendation;

    if (score >= 85) {
      rating = 'Excellent';
      recommendation = 'Go fishing';
    } else if (score >= 70) {
      rating = 'Good';
      recommendation = 'Conditions are favourable';
    } else if (score >= 50) {
      rating = 'Fair';
      recommendation = 'Fish with realistic expectations';
    } else {
      rating = 'Poor';
      recommendation = 'Consider another day';
    }

    return ReadinessResult(
      score: score,
      rating: rating,
      recommendation: recommendation,
      reasons: reasons,
    );
  }
}