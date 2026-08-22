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
    required int environmentalScore,
    required List<String> reasons,
  }) {
    // environmentalScore is already an aggregated 0-100 match score (see
    // EnvironmentalEvaluator), so it goes straight to ConfidenceEngine.
    // Do not route it through ScoreEngine.calculate() as a single-element
    // weights list - that collapses ScoreEngine's `weights.length * 20`
    // denominator to a fixed 20, saturating any score >= 20 to 100.
    final confidence = confidenceEngine.calculate(
      environmentalScore,
    );

    return Recommendation(
      species: species,
      bait: bait,
      location: location,
      bestTime: bestTime,
      score: environmentalScore,
      confidence: confidence,
      reasons: reasons,
    );
  }
}