class ScoreEngine {
  const ScoreEngine();

  int calculate(
      List<int> weights,
      ) {
    if (weights.isEmpty) {
      return 0;
    }

    final total = weights.fold<int>(
      0,
          (sum, value) => sum + value,
    );

    final maximum = weights.length * 20;

    final percentage =
    (total / maximum * 100).round();

    return percentage.clamp(
      0,
      100,
    );
  }

  int scoreCondition({
    required bool matches,
    required int weight,
  }) {
    if (!matches) {
      return 0;
    }

    return weight;
  }

  int scoreRange({
    required double value,
    required double minimum,
    required double maximum,
    required int weight,
  }) {
    if (value < minimum) {
      return 0;
    }

    if (value > maximum) {
      return 0;
    }

    return weight;
  }
}