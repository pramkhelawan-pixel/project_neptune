import 'recommendation_level.dart';
import 'recommendation_reason.dart';

/// Final recommendation produced by Neptune's intelligence engine.
///
/// This entity represents Neptune's complete assessment for a
/// fishing opportunity.
class FishingRecommendation {
  /// Overall recommendation.
  final RecommendationLevel level;

  /// Confidence score (0–100).
  final int confidence;

  /// Explanation of why the recommendation was made.
  final List<RecommendationReason> reasons;

  /// Best fishing window.
  final DateTime? bestStart;

  /// End of the recommended fishing window.
  final DateTime? bestEnd;

  /// Short recommendation shown in cards.
  final String summary;

  const FishingRecommendation({
    required this.level,
    required this.confidence,
    required this.reasons,
    required this.summary,
    this.bestStart,
    this.bestEnd,
  });

  /// Returns true if Neptune recommends fishing.
  bool get shouldFish =>
      level == RecommendationLevel.excellent ||
          level == RecommendationLevel.good;

  /// Returns true if Neptune advises against fishing.
  bool get shouldAvoid =>
      level == RecommendationLevel.notRecommended;

  /// Returns true if a fishing window exists.
  bool get hasFishingWindow =>
      bestStart != null &&
          bestEnd != null;

  /// Returns true if supporting evidence exists.
  bool get hasReasons =>
      reasons.isNotEmpty;

  FishingRecommendation copyWith({
    RecommendationLevel? level,
    int? confidence,
    List<RecommendationReason>? reasons,
    DateTime? bestStart,
    DateTime? bestEnd,
    String? summary,
  }) {
    return FishingRecommendation(
      level: level ?? this.level,
      confidence: confidence ?? this.confidence,
      reasons: reasons ?? this.reasons,
      bestStart: bestStart ?? this.bestStart,
      bestEnd: bestEnd ?? this.bestEnd,
      summary: summary ?? this.summary,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FishingRecommendation &&
            level == other.level &&
            confidence == other.confidence &&
            summary == other.summary &&
            bestStart == other.bestStart &&
            bestEnd == other.bestEnd;
  }

  @override
  int get hashCode => Object.hash(
    level,
    confidence,
    summary,
    bestStart,
    bestEnd,
  );
}