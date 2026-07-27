class ScoreEngine {
  const ScoreEngine();

  int calculate(
      List<int> weights,
      ) {
    return weights.fold(
      0,
          (sum, value) => sum + value,
    );
  }
}