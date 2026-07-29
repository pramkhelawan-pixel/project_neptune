import '../models/recommendation.dart';
import 'confidence_engine.dart';
import 'score_engine.dart';

class RecommendationEngine {
  final ScoreEngine scoreEngine;
  final ConfidenceEngine confidenceEngine;

  const RecommendationEngine({
    required this.scoreEngine,
    required this.confidenceEngine,
  });

  Recommendation build({
    required String species,
    required String bait,
    required String location,
    required String bestTime,
    required List<int> weights,
    required List<String> reasons,
  }) {
    final score = scoreEngine.calculate(
      weights,
    );

    final confidence = confidenceEngine.calculate(
      score,
    );

    return Recommendation(
      species: species,
      bait: bait,
      location: location,
      bestTime: bestTime,
      score: score,
      confidence: confidence,
      reasons: reasons,
    );
  }
}