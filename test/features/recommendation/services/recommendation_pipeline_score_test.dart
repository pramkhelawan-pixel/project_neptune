import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/marine/domain/enums/tide_state.dart';
import 'package:project_neptune/features/marine/domain/models/marine_conditions.dart';
import 'package:project_neptune/features/recommendation/domain/recommendation_request.dart';
import 'package:project_neptune/features/recommendation/services/recommendation_pipeline.dart';

void main() {
  // Regression test for the Recommendation Details semantic bug:
  // RecommendationResponse.score must carry the raw environmental
  // condition-match score (see EnvironmentalEvaluator), NOT a copy of
  // `confidence`. Before the fix, RecommendationDetailsPage fed
  // `recommendation.confidence.round()` into a parameter named
  // `environmentalScore`, silently redisplaying the confidence figure a
  // second time under a differently-labelled "Environmental Readiness"
  // card as if it were an independent measurement.

  final pipeline = RecommendationPipeline();

  test('score and confidence are carried as distinct, independently '
      'correct values for a partial (3-of-5-factor) match', () async {
    // 3 of Shad's 5 preferred factors matched -> environmental score 60,
    // which ConfidenceEngine maps to a *different* number, 80. If `score`
    // were ever accidentally derived from `confidence` (or vice versa),
    // this test would catch it, since 60 != 80.
    final conditions = MarineConditions(
      windSpeed: 10,
      windDirection: 'N', // does not match Shad's preferred direction
      swellHeight: 1.0,
      swellPeriod: 8,
      waterTemperature: 20.0,
      airTemperature: 20,
      atmosphericPressure: 1015,
      tideHeight: 1.0,
      tideState: 'Incoming',
      canonicalTideState: TideState.incoming,
      nextHighTide: DateTime(2026, 1, 1, 6),
      nextLowTide: DateTime(2026, 1, 1, 12),
      moonPhase: 'Last Quarter', // does not match Shad's preferred phase
      sunrise: DateTime(2026, 1, 1, 5, 30),
      sunset: DateTime(2026, 1, 1, 19, 30),
    );

    final request = RecommendationRequest(
      marineConditions: conditions,
      species: 'Shad',
      location: 'Test Beach',
    );

    final response = await pipeline.execute(request);

    expect(response.score, 60);
    expect(response.confidence, 80);
    expect(
      response.score,
      isNot(response.confidence.round()),
      reason: 'score must be the raw environmental match count, not a '
          "copy of confidence's lookup-derived value",
    );
  });

  test('score reaches the true 0 and 100 extremes independently of '
      "confidence's own (different) extremes", () async {
    final noMatch = MarineConditions(
      windSpeed: 10,
      windDirection: 'N',
      swellHeight: 5.0,
      swellPeriod: 8,
      waterTemperature: 10.0,
      airTemperature: 20,
      atmosphericPressure: 1015,
      tideHeight: 1.0,
      tideState: 'Outgoing',
      canonicalTideState: TideState.outgoing,
      nextHighTide: DateTime(2026, 1, 1, 6),
      nextLowTide: DateTime(2026, 1, 1, 12),
      moonPhase: 'Last Quarter',
      sunrise: DateTime(2026, 1, 1, 5, 30),
      sunset: DateTime(2026, 1, 1, 19, 30),
    );

    final zeroResponse = await pipeline.execute(RecommendationRequest(
      marineConditions: noMatch,
      species: 'Shad',
      location: 'Test Beach',
    ));

    expect(zeroResponse.score, 0);
    expect(zeroResponse.confidence, 35); // ConfidenceEngine's floor, not 0

    final fullMatch = MarineConditions(
      windSpeed: 10,
      windDirection: 'SW',
      swellHeight: 1.0,
      swellPeriod: 8,
      waterTemperature: 20.0,
      airTemperature: 20,
      atmosphericPressure: 1015,
      tideHeight: 1.0,
      tideState: 'Incoming',
      canonicalTideState: TideState.incoming,
      nextHighTide: DateTime(2026, 1, 1, 6),
      nextLowTide: DateTime(2026, 1, 1, 12),
      moonPhase: 'Full Moon',
      sunrise: DateTime(2026, 1, 1, 5, 30),
      sunset: DateTime(2026, 1, 1, 19, 30),
    );

    final fullResponse = await pipeline.execute(RecommendationRequest(
      marineConditions: fullMatch,
      species: 'Shad',
      location: 'Test Beach',
    ));

    expect(fullResponse.score, 100);
    expect(fullResponse.confidence, 98); // ConfidenceEngine's ceiling, not 100
  });
}
