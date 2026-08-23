import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/lunar/domain/solunar_period.dart';
import 'package:project_neptune/features/marine/domain/enums/tide_state.dart';
import 'package:project_neptune/features/marine/domain/models/marine_conditions.dart';
import 'package:project_neptune/features/recommendation/data/species_environment_profiles.dart';
import 'package:project_neptune/features/recommendation/domain/species_environment_profile.dart';
import 'package:project_neptune/features/recommendation/services/best_fishing_window_engine.dart';
import 'package:project_neptune/features/recommendation/services/confidence_engine.dart';

void main() {
  // Base conditions matching every one of shadEnvironmentProfile's
  // non-tide preferences (water temperature, swell, wind direction, moon
  // phase), so tide is the only factor that differs between candidates.
  // `canonicalTideState` here is irrelevant to the engine -- it is always
  // overridden per-candidate based on the tide event the window is
  // anchored on.
  MarineConditions baseConditions({
    DateTime? nextHighTide,
    DateTime? nextLowTide,
    List<SolunarPeriod> majorPeriods = const [],
    List<SolunarPeriod> minorPeriods = const [],
  }) {
    return MarineConditions(
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
      nextHighTide: nextHighTide,
      nextLowTide: nextLowTide,
      moonPhase: 'Full Moon',
      sunrise: DateTime(2026, 1, 1, 5, 30),
      sunset: DateTime(2026, 1, 1, 19, 30),
      majorPeriods: majorPeriods,
      minorPeriods: minorPeriods,
    );
  }

  group('candidate generation', () {
    const engine = BestFishingWindowEngine();

    test('high-tide candidate: produced from nextHighTide, ±1h by default', () {
      final highTide = DateTime(2026, 1, 1, 6, 0);
      final conditions = baseConditions(nextHighTide: highTide);

      final result = engine.evaluate(
        conditions: conditions,
        profile: shadEnvironmentProfile,
      );

      expect(result.candidates, hasLength(1));
      final candidate = result.candidates.single;
      expect(candidate.anchorTideState, TideState.high);
      expect(candidate.start, DateTime(2026, 1, 1, 5, 0));
      expect(candidate.end, DateTime(2026, 1, 1, 7, 0));
      // shadEnvironmentProfile's preferredTides includes 'High', plus all
      // four non-tide factors match in baseConditions -> full score.
      expect(candidate.score, 100);
      expect(result.best, same(candidate));
    });

    test('low-tide candidate: produced from nextLowTide, ±1h by default', () {
      final lowTide = DateTime(2026, 1, 1, 12, 0);
      final conditions = baseConditions(nextLowTide: lowTide);

      final result = engine.evaluate(
        conditions: conditions,
        profile: shadEnvironmentProfile,
      );

      expect(result.candidates, hasLength(1));
      final candidate = result.candidates.single;
      expect(candidate.anchorTideState, TideState.low);
      expect(candidate.start, DateTime(2026, 1, 1, 11, 0));
      expect(candidate.end, DateTime(2026, 1, 1, 13, 0));
      // shadEnvironmentProfile's preferredTides does not include 'Low' ->
      // only the four non-tide factors match.
      expect(candidate.score, 80);
      expect(result.best, same(candidate));
    });

    test('multiple candidates: both high and low tide present', () {
      final conditions = baseConditions(
        nextHighTide: DateTime(2026, 1, 1, 6, 0),
        nextLowTide: DateTime(2026, 1, 1, 12, 0),
      );

      final result = engine.evaluate(
        conditions: conditions,
        profile: shadEnvironmentProfile,
      );

      expect(result.candidates, hasLength(2));
      expect(
        result.candidates.map((c) => c.anchorTideState),
        containsAll([TideState.high, TideState.low]),
      );
    });

    test('best candidate selection: higher-scoring candidate wins', () {
      final conditions = baseConditions(
        nextHighTide: DateTime(2026, 1, 1, 6, 0), // scores 100 (tide matches)
        nextLowTide: DateTime(2026, 1, 1, 12, 0), // scores 80 (tide doesn't)
      );

      final result = engine.evaluate(
        conditions: conditions,
        profile: shadEnvironmentProfile,
      );

      expect(result.best!.anchorTideState, TideState.high);
      expect(result.best!.score, 100);
    });

    test('no usable tide data: both next tide events null', () {
      final conditions = baseConditions();

      final result = engine.evaluate(
        conditions: conditions,
        profile: shadEnvironmentProfile,
      );

      expect(result.best, isNull);
      expect(result.candidates, isEmpty);
    });
  });

  group('invalid/missing environmental data', () {
    const engine = BestFishingWindowEngine();

    test('missing optional fields (swell direction, precipitation) do not throw', () {
      final conditions = MarineConditions(
        windSpeed: 10,
        windDirection: 'SW',
        swellHeight: 1.0,
        swellPeriod: 8,
        // swellDirection, precipitation, precipitationProbability,
        // observedAt intentionally omitted (nullable).
        waterTemperature: 20.0,
        airTemperature: 20,
        atmosphericPressure: 1015,
        tideHeight: 1.0,
        tideState: 'Incoming',
        canonicalTideState: TideState.incoming,
        nextHighTide: DateTime(2026, 1, 1, 6, 0),
        nextLowTide: null,
        moonPhase: 'Full Moon',
        sunrise: DateTime(2026, 1, 1, 5, 30),
        sunset: DateTime(2026, 1, 1, 19, 30),
      );

      expect(
        () => engine.evaluate(conditions: conditions, profile: shadEnvironmentProfile),
        returnsNormally,
      );
    });

    test('extreme out-of-range values do not throw and stay within 0-100', () {
      final conditions = baseConditions(nextHighTide: DateTime(2026, 1, 1, 6, 0))
          .copyWith(windSpeed: -500, swellHeight: 999.0, waterTemperature: -40.0);

      final result = engine.evaluate(conditions: conditions, profile: shadEnvironmentProfile);

      expect(result.best, isNotNull);
      expect(result.best!.score, inInclusiveRange(0, 100));
    });
  });

  group('Premium Solunar tiebreak', () {
    // A profile with no tide preference at all, so both the high- and
    // low-tide candidates score identically (a genuine tie) and Solunar
    // overlap is the only thing that can break it.
    const tieProfile = SpeciesEnvironmentProfile(
      species: 'Tie Species',
      minimumWaterTemperature: 15.0,
      maximumWaterTemperature: 25.0,
      minimumSwellHeight: 0.5,
      maximumSwellHeight: 2.0,
      preferredTides: [],
      preferredWindDirections: ['SW'],
      preferredMoonPhases: ['Full'],
    );

    test('Premium: overlapping candidate wins the tie', () {
      final highTide = DateTime(2026, 1, 1, 6, 0);
      final lowTide = DateTime(2026, 1, 1, 12, 0);

      final conditions = baseConditions(
        nextHighTide: highTide,
        nextLowTide: lowTide,
        // Major period overlaps the low-tide window (11:00-13:00), not the
        // high-tide window (05:00-07:00).
        majorPeriods: [
          SolunarPeriod(
            start: DateTime(2026, 1, 1, 11, 30),
            end: DateTime(2026, 1, 1, 12, 30),
          ),
        ],
      );

      const engine = BestFishingWindowEngine();
      final result = engine.evaluate(
        conditions: conditions,
        profile: tieProfile,
        includeSolunarTiebreak: true,
      );

      // Both candidates score identically before the tiebreak.
      expect(result.candidates[0].score, result.candidates[1].score);

      expect(result.best!.anchorTideState, TideState.low);
      expect(result.best!.solunarOverlap, isTrue);
    });
  });

  group('Free-user behaviour and no Premium data leakage', () {
    test('Free user: solunarOverlap is always false, even when periods overlap', () {
      final highTide = DateTime(2026, 1, 1, 6, 0);
      final conditions = baseConditions(
        nextHighTide: highTide,
        majorPeriods: [
          SolunarPeriod(
            start: DateTime(2026, 1, 1, 5, 30),
            end: DateTime(2026, 1, 1, 6, 30),
          ),
        ],
      );

      const engine = BestFishingWindowEngine();
      final result = engine.evaluate(
        conditions: conditions,
        profile: shadEnvironmentProfile,
        includeSolunarTiebreak: false,
      );

      expect(result.best!.solunarOverlap, isFalse);
    });

    test(
      'no Premium data leakage: Free-tier result is identical whether or not '
      'Solunar periods are populated',
      () {
        final highTide = DateTime(2026, 1, 1, 6, 0);
        final lowTide = DateTime(2026, 1, 1, 12, 0);

        final withoutSolunar = baseConditions(
          nextHighTide: highTide,
          nextLowTide: lowTide,
        );
        final withSolunar = baseConditions(
          nextHighTide: highTide,
          nextLowTide: lowTide,
          majorPeriods: [
            SolunarPeriod(
              start: DateTime(2026, 1, 1, 11, 0),
              end: DateTime(2026, 1, 1, 13, 0),
            ),
          ],
          minorPeriods: [
            SolunarPeriod(
              start: DateTime(2026, 1, 1, 5, 0),
              end: DateTime(2026, 1, 1, 7, 0),
            ),
          ],
        );

        const engine = BestFishingWindowEngine();
        final resultA = engine.evaluate(
          conditions: withoutSolunar,
          profile: shadEnvironmentProfile,
          includeSolunarTiebreak: false,
        );
        final resultB = engine.evaluate(
          conditions: withSolunar,
          profile: shadEnvironmentProfile,
          includeSolunarTiebreak: false,
        );

        expect(resultA.best!.anchorTideState, resultB.best!.anchorTideState);
        expect(resultA.best!.score, resultB.best!.score);
        expect(resultA.best!.solunarOverlap, isFalse);
        expect(resultB.best!.solunarOverlap, isFalse);
        expect(
          resultA.candidates.map((c) => c.score),
          resultB.candidates.map((c) => c.score),
        );
      },
    );
  });

  group('qualitative readiness classification', () {
    const engine = BestFishingWindowEngine();
    const confidenceEngine = ConfidenceEngine();

    // A profile with no tide preference, so score is driven purely by the
    // count of matching non-tide factors (water temp, swell, wind, moon) --
    // 0, 20, 40, 60, or 80 in steps of one factor at a time.
    const stepProfile = SpeciesEnvironmentProfile(
      species: 'Step Species',
      minimumWaterTemperature: 18.0,
      maximumWaterTemperature: 22.0,
      minimumSwellHeight: 0.8,
      maximumSwellHeight: 1.5,
      preferredTides: [],
      preferredWindDirections: ['SW'],
      preferredMoonPhases: ['Full'],
    );

    test('candidate.qualitativeLevel always matches ConfidenceEngine.readinessLevel', () {
      final fixtures = <MarineConditions>[
        baseConditions(nextHighTide: DateTime(2026, 1, 1, 6, 0)).copyWith(
          waterTemperature: 0.0, // fails
          swellHeight: 0.0, // fails
          windDirection: 'N', // fails
          moonPhase: 'New Moon', // fails
        ),
        baseConditions(nextHighTide: DateTime(2026, 1, 1, 6, 0)).copyWith(
          swellHeight: 0.0,
          windDirection: 'N',
          moonPhase: 'New Moon',
        ), // water temp matches only -> 20
        baseConditions(nextHighTide: DateTime(2026, 1, 1, 6, 0)).copyWith(
          windDirection: 'N',
          moonPhase: 'New Moon',
        ), // water temp + swell -> 40
        baseConditions(nextHighTide: DateTime(2026, 1, 1, 6, 0)).copyWith(
          moonPhase: 'New Moon',
        ), // water temp + swell + wind -> 60
        baseConditions(nextHighTide: DateTime(2026, 1, 1, 6, 0)), // all four -> 80
      ];

      for (final conditions in fixtures) {
        final result = engine.evaluate(conditions: conditions, profile: stepProfile);
        final candidate = result.best!;

        expect(
          candidate.qualitativeLevel,
          confidenceEngine.readinessLevel(candidate.score),
          reason: 'score=${candidate.score} should map through the existing '
              'ConfidenceEngine.readinessLevel scale, not a separate label set',
        );
      }
    });
  });

  group('midnight/day-boundary handling', () {
    const engine = BestFishingWindowEngine();

    test('a tide event just after midnight produces a window crossing into the previous day', () {
      final highTide = DateTime(2026, 1, 2, 0, 20);
      final conditions = baseConditions(nextHighTide: highTide);

      final result = engine.evaluate(conditions: conditions, profile: shadEnvironmentProfile);

      final candidate = result.best!;
      expect(candidate.start, DateTime(2026, 1, 1, 23, 20));
      expect(candidate.end, DateTime(2026, 1, 2, 1, 20));
      expect(candidate.start.day, isNot(candidate.end.day));
    });
  });

  group('configurable window half-width', () {
    test('a non-default half-width changes the window boundaries without new architecture', () {
      const engine = BestFishingWindowEngine(windowHalfWidth: Duration(minutes: 30));
      final highTide = DateTime(2026, 1, 1, 6, 0);
      final conditions = baseConditions(nextHighTide: highTide);

      final result = engine.evaluate(conditions: conditions, profile: shadEnvironmentProfile);

      expect(result.best!.start, DateTime(2026, 1, 1, 5, 30));
      expect(result.best!.end, DateTime(2026, 1, 1, 6, 30));
    });
  });
}
