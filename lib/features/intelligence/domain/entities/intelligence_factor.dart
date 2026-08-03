import '../../../knowledge/domain/enums/confidence_level.dart';

class IntelligenceFactor {
  final String name;
  final double score;
  final ConfidenceLevel confidence;
  final String explanation;

  const IntelligenceFactor({
    required this.name,
    required this.score,
    required this.confidence,
    required this.explanation,
  });
}