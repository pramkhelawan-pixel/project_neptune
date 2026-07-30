class ConfidenceEngine {
  const ConfidenceEngine();

  int calculate(
      int environmentalScore,
      ) {
    if (environmentalScore >= 90) {
      return 98;
    }

    if (environmentalScore >= 80) {
      return 94;
    }

    if (environmentalScore >= 70) {
      return 88;
    }

    if (environmentalScore >= 60) {
      return 80;
    }

    if (environmentalScore >= 50) {
      return 72;
    }

    if (environmentalScore >= 40) {
      return 62;
    }

    if (environmentalScore >= 30) {
      return 50;
    }

    return 35;
  }

  String readinessLevel(
      int environmentalScore,
      ) {
    if (environmentalScore >= 90) {
      return 'Excellent';
    }

    if (environmentalScore >= 75) {
      return 'Very Good';
    }

    if (environmentalScore >= 60) {
      return 'Good';
    }

    if (environmentalScore >= 45) {
      return 'Fair';
    }

    if (environmentalScore >= 30) {
      return 'Poor';
    }

    return 'Very Poor';
  }
}