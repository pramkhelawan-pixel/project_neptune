import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/marine/domain/enums/tide_state.dart';
import 'package:project_neptune/features/marine/domain/models/marine_conditions.dart';
import 'package:project_neptune/features/recommendation/data/species_environment_profiles.dart';
import 'package:project_neptune/features/recommendation/domain/recommendation_request.dart';
import 'package:project_neptune/features/recommendation/models/recommendation.dart';
import 'package:project_neptune/features/recommendation/services/confidence_engine.dart';
import 'package:project_neptune/features/recommendation/services/environmental_evaluator.dart';
import 'package:project_neptune/features/recommendation/services/recommendation_engine.dart';
import 'package:project_neptune/features/recommendation/services/recommendation_seed_provider.dart';
import 'package:project_neptune/features/recommendation/services/score_engine.dart';

void main() {
  // A regression test for the confidence-saturation bug: with the old
  // wiring, RecommendationSeedProvider wrapped EnvironmentalEvaluator's
  // already-aggregated 0-100 score as a single-element `weights` list and
  // routed it through ScoreEngine, whose `weights.length * 20` denominator
  // collapsed to a fixed 20 for a one-element list. Any score >= 20 (just
  // one of five factors matching) then saturated to 100 -> confidence 98.
  // The fix removes that call path: the environmental score now feeds
  // ConfidenceEngine directly.

  group('ConfidenceEngine.calculate - all buckets', () {
    const engine = ConfidenceEngine();

    final cases = <int, int>{
      // input environmentalScore : expected confidence bucket
      0: 35,
      15: 35,
      29: 35,
      30: 50,
      35: 50,
      39: 50,
      40: 62,
      45: 62,
      49: 62,
      50: 72,
      55: 72,
      59: 72,
      60: 80,
      65: 80,
      69: 80,
      70: 88,
      75: 88,
      79: 88,
      80: 94,
      85: 94,
      89: 94,
      90: 98,
      95: 98,
      100: 98,
    };

    cases.forEach((input, expected) {
      test(
        'environmentalScore=$input -> confidence=$expected',
        () {
          expect(engine.calculate(input), expected);
        },
      );
    });
  });

  group('EnvironmentalEvaluator.evaluate - five-factor model', () {
    const evaluator = EnvironmentalEvaluator();

    // Base conditions that match none of shadEnvironmentProfile's five
    // preferences, so factors can be flipped on one at a time.
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

    test('zero matching factors -> score 0', () {
      final result = evaluator.evaluate(
        profile: shadEnvironmentProfile,
        conditions: noMatch,
      );
      expect(result.score, 0);
    });

    test('1 matching factor (water temperature) -> score 20', () {
      final conditions = noMatch.copyWith(waterTemperature: 20.0);
      final result = evaluator.evaluate(
        profile: shadEnvironmentProfile,
        conditions: conditions,
      );
      expect(result.score, 20);
    });

    test('2 matching factors (+ swell) -> score 40', () {
      final conditions = noMatch.copyWith(
        waterTemperature: 20.0,
        swellHeight: 1.0,
      );
      final result = evaluator.evaluate(
        profile: shadEnvironmentProfile,
        conditions: conditions,
      );
      expect(result.score, 40);
    });

    test('3 matching factors (+ tide) -> score 60', () {
      final conditions = noMatch.copyWith(
        waterTemperature: 20.0,
        swellHeight: 1.0,
        canonicalTideState: TideState.incoming,
      );
      final result = evaluator.evaluate(
        profile: shadEnvironmentProfile,
        conditions: conditions,
      );
      expect(result.score, 60);
    });

    test('4 matching factors (+ wind) -> score 80', () {
      final conditions = noMatch.copyWith(
        waterTemperature: 20.0,
        swellHeight: 1.0,
        canonicalTideState: TideState.incoming,
        windDirection: 'SW',
      );
      final result = evaluator.evaluate(
        profile: shadEnvironmentProfile,
        conditions: conditions,
      );
      expect(result.score, 80);
    });

    test('5 matching factors (+ moon) -> score 100', () {
      final conditions = noMatch.copyWith(
        waterTemperature: 20.0,
        swellHeight: 1.0,
        canonicalTideState: TideState.incoming,
        windDirection: 'SW',
        moonPhase: 'Full Moon',
      );
      final result = evaluator.evaluate(
        profile: shadEnvironmentProfile,
        conditions: conditions,
      );
      expect(result.score, 100);
    });
  });

  group('Recommendation integration - confidence reflects match quality', () {
    const recommendationEngine = RecommendationEngine(
      scoreEngine: ScoreEngine(),
      confidenceEngine: ConfidenceEngine(),
    );

    Recommendation buildFor(int environmentalScore) {
      return recommendationEngine.build(
        species: 'Shad',
        bait: 'Sardine',
        location: 'Test Beach',
        bestTime: 'Sunrise',
        environmentalScore: environmentalScore,
        reasons: const [],
      );
    }

    test(
      'materially different match quality produces materially different confidence',
      () {
        final poor = buildFor(0);
        final weak = buildFor(20);
        final moderate = buildFor(40);
        final good = buildFor(60);
        final strong = buildFor(80);
        final ideal = buildFor(100);

        // The bug made every non-zero score saturate to 98. Assert
        // ConfidenceEngine's real bucket spread is preserved instead: 0 and
        // 20 both fall below the lowest 30-point threshold and share the
        // "Very Poor" bucket (35) by the existing, unmodified bucket design
        // - that is expected, pre-existing behaviour, not the bug.
        final confidences = [
          poor.confidence,
          weak.confidence,
          moderate.confidence,
          good.confidence,
          strong.confidence,
          ideal.confidence,
        ];

        expect(confidences, [35, 35, 62, 80, 94, 98]);
        // Materially different overall: poor and ideal matches must not
        // read the same, and the confidences span most of the range.
        expect(confidences.first, isNot(confidences.last));
        expect(confidences.toSet().length, greaterThanOrEqualTo(4));
      },
    );

    test(
      'confidence is monotonically non-decreasing as match quality improves, '
      'and strictly higher for a strong/ideal match than a poor one',
      () {
        final scores = [0, 20, 40, 60, 80, 100];
        final confidences =
            scores.map((s) => buildFor(s).confidence).toList();

        for (var i = 1; i < confidences.length; i++) {
          expect(
            confidences[i],
            greaterThanOrEqualTo(confidences[i - 1]),
            reason:
                'confidence for environmentalScore=${scores[i]} should not '
                'be lower than confidence for environmentalScore=${scores[i - 1]}',
          );
        }

        // The bug's saturation meant a 1-factor match (weights=[20]) already
        // read identically to a 5-factor match (weights=[100]) - both hit
        // 98. Assert that no longer holds: match quality must be reflected
        // across the range, not flattened to two values.
        expect(confidences.last, greaterThan(confidences.first));
      },
    );

    test(
      'a single matching factor no longer saturates confidence to 98',
      () {
        final oneFactorMatch = buildFor(20);
        final allFactorsMatch = buildFor(100);

        expect(oneFactorMatch.confidence, isNot(98));
        expect(oneFactorMatch.confidence, isNot(allFactorsMatch.confidence));
      },
    );
  });

  group('End-to-end wiring - RecommendationSeedProvider to RecommendationEngine', () {
    // Structural guard: RecommendationSeed no longer carries a `weights`
    // list at all, so the invalid single-element-list call path into
    // ScoreEngine is no longer expressible through this pipeline - it is a
    // compile-time guarantee, not just a runtime check.
    const recommendationEngine = RecommendationEngine(
      scoreEngine: ScoreEngine(),
      confidenceEngine: ConfidenceEngine(),
    );
    const seedProvider = RecommendationSeedProvider();

    test('a strong real match produces a non-saturated, high confidence', () async {
      final conditions = MarineConditions(
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

      final request = RecommendationRequest(
        marineConditions: conditions,
        species: 'Shad',
        location: 'Test Beach',
      );

      final seed = await seedProvider.getSeed(request);

      expect(seed.environmentalScore, 100);

      final recommendation = recommendationEngine.build(
        species: request.species,
        bait: seed.bait,
        location: request.location,
        bestTime: seed.bestTime,
        environmentalScore: seed.environmentalScore,
        reasons: seed.reasons,
      );

      expect(recommendation.confidence, 98);
    });

    test('a poor real match produces a low, non-saturated confidence', () async {
      final conditions = MarineConditions(
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

      final request = RecommendationRequest(
        marineConditions: conditions,
        species: 'Shad',
        location: 'Test Beach',
      );

      final seed = await seedProvider.getSeed(request);

      expect(seed.environmentalScore, 0);

      final recommendation = recommendationEngine.build(
        species: request.species,
        bait: seed.bait,
        location: request.location,
        bestTime: seed.bestTime,
        environmentalScore: seed.environmentalScore,
        reasons: seed.reasons,
      );

      expect(recommendation.confidence, 35);
      expect(recommendation.confidence, isNot(98));
    });
  });
}
