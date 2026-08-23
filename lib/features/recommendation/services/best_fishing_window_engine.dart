import '../../marine/domain/enums/tide_state.dart';
import '../../marine/domain/models/marine_conditions.dart';

import '../domain/species_environment_profile.dart';

import 'confidence_engine.dart';
import 'environmental_evaluator.dart';

/// A single candidate fishing window, anchored on a known future tide event.
///
/// The window's tide state is known with certainty (it is the event the
/// window is centred on), even though the other environmental readings
/// ([conditions]' wind/swell/water temperature/moon phase) are held at
/// Neptune's most recent single marine snapshot rather than a per-hour
/// forecast -- see [BestFishingWindowEngine] for why that is the honest V1
/// limitation, not an oversight.
class BestFishingWindowCandidate {
  /// Window start (anchor time minus the engine's configured half-width).
  final DateTime start;

  /// Window end (anchor time plus the engine's configured half-width).
  final DateTime end;

  /// The tide state this window is anchored on -- always [TideState.high]
  /// or [TideState.low].
  final TideState anchorTideState;

  /// The existing [EnvironmentalEvaluator]'s 0-100 boolean-gate score for
  /// this window, unmodified from that evaluator's own scoring rules.
  final int score;

  /// Qualitative label from the existing
  /// [ConfidenceEngine.readinessLevel] scale -- never a percentage, and
  /// never a claim about probability of catching fish.
  final String qualitativeLevel;

  /// Human-readable reasons from [EnvironmentalEvaluator], unmodified.
  final List<String> reasons;

  /// Whether this window overlaps a Solunar major/minor period. Only ever
  /// computed (and only ever consulted for ranking) when the caller opts
  /// into the Premium tiebreak -- see [BestFishingWindowEngine.evaluate].
  /// Always `false` for a Free user's result.
  final bool solunarOverlap;

  const BestFishingWindowCandidate({
    required this.start,
    required this.end,
    required this.anchorTideState,
    required this.score,
    required this.qualitativeLevel,
    required this.reasons,
    this.solunarOverlap = false,
  });
}

/// Result of evaluating Neptune's Best Fishing Window for a single marine
/// snapshot: the best candidate (or null if no tide data was available),
/// plus every candidate considered, ranked best to worst.
class BestFishingWindowResult {
  final BestFishingWindowCandidate? best;
  final List<BestFishingWindowCandidate> candidates;

  const BestFishingWindowResult({
    required this.best,
    required this.candidates,
  });
}

/// Neptune's Best Fishing Window engine (V1 -- tide/Solunar-scoped).
///
/// Generates 1-2 candidate windows from the existing
/// `MarineConditions.nextHighTide`/`nextLowTide` primitives, scores each by
/// reusing the existing [EnvironmentalEvaluator] unmodified, and reduces
/// the result to the existing [ConfidenceEngine.readinessLevel] qualitative
/// scale. Deliberately does not introduce a percentage or a per-hour
/// wind/swell forecast -- `MarineConditions` carries a single snapshot, not
/// a time series, so only the tide (known in advance from the anchor
/// event) and Solunar periods (already computed locally, with no network
/// call) can honestly vary across candidates. See the read-only audit this
/// implementation followed for the full reasoning.
///
/// [windowHalfWidth] is a configurable heuristic, not a scientifically
/// fixed rule -- it defaults to Neptune's existing "one hour either side
/// of the tide event" convention but can be tuned later without changing
/// this engine's shape.
class BestFishingWindowEngine {
  const BestFishingWindowEngine({
    this.windowHalfWidth = const Duration(hours: 1),
    this.environmentalEvaluator = const EnvironmentalEvaluator(),
    this.confidenceEngine = const ConfidenceEngine(),
  });

  final Duration windowHalfWidth;
  final EnvironmentalEvaluator environmentalEvaluator;
  final ConfidenceEngine confidenceEngine;

  /// Evaluates the best fishing window for [conditions] against a single
  /// [profile].
  ///
  /// [includeSolunarTiebreak] must only ever be `true` for a user with a
  /// live, confirmed Premium entitlement (see `currentProfileProvider`).
  /// When `false` (the Free-tier default), Solunar major/minor periods are
  /// never read, so the result is provably identical regardless of
  /// whether `conditions.majorPeriods`/`minorPeriods` are populated --
  /// Premium-only data can never influence a Free user's window.
  BestFishingWindowResult evaluate({
    required MarineConditions conditions,
    required SpeciesEnvironmentProfile profile,
    bool includeSolunarTiebreak = false,
  }) {
    final candidates = <BestFishingWindowCandidate>[];

    final nextHighTide = conditions.nextHighTide;
    if (nextHighTide != null) {
      candidates.add(
        _buildCandidate(
          anchor: nextHighTide,
          anchorTideState: TideState.high,
          conditions: conditions,
          profile: profile,
          includeSolunarTiebreak: includeSolunarTiebreak,
        ),
      );
    }

    final nextLowTide = conditions.nextLowTide;
    if (nextLowTide != null) {
      candidates.add(
        _buildCandidate(
          anchor: nextLowTide,
          anchorTideState: TideState.low,
          conditions: conditions,
          profile: profile,
          includeSolunarTiebreak: includeSolunarTiebreak,
        ),
      );
    }

    if (candidates.isEmpty) {
      return const BestFishingWindowResult(best: null, candidates: []);
    }

    final ranked = List<BestFishingWindowCandidate>.from(candidates)
      ..sort((a, b) {
        final byScore = b.score.compareTo(a.score);
        if (byScore != 0) return byScore;

        if (!includeSolunarTiebreak) return 0;

        // Premium-only tiebreak: prefer the candidate overlapping a
        // Solunar major/minor period. Never consulted for Free users --
        // guarded above by short-circuiting on `includeSolunarTiebreak`.
        final aOverlap = a.solunarOverlap ? 1 : 0;
        final bOverlap = b.solunarOverlap ? 1 : 0;
        return bOverlap.compareTo(aOverlap);
      });

    return BestFishingWindowResult(best: ranked.first, candidates: ranked);
  }

  BestFishingWindowCandidate _buildCandidate({
    required DateTime anchor,
    required TideState anchorTideState,
    required MarineConditions conditions,
    required SpeciesEnvironmentProfile profile,
    required bool includeSolunarTiebreak,
  }) {
    final start = anchor.subtract(windowHalfWidth);
    final end = anchor.add(windowHalfWidth);

    // The window's tide state is known with certainty (it's the anchor
    // event); everything else on `conditions` is Neptune's latest single
    // snapshot, not a forecast for this specific future window -- see the
    // class doc.
    final candidateConditions = conditions.copyWith(
      canonicalTideState: anchorTideState,
    );

    final evaluation = environmentalEvaluator.evaluate(
      profile: profile,
      conditions: candidateConditions,
    );

    return BestFishingWindowCandidate(
      start: start,
      end: end,
      anchorTideState: anchorTideState,
      score: evaluation.score,
      qualitativeLevel: confidenceEngine.readinessLevel(evaluation.score),
      reasons: evaluation.reasons,
      solunarOverlap: includeSolunarTiebreak
          ? _overlapsSolunarPeriod(start, end, conditions)
          : false,
    );
  }

  bool _overlapsSolunarPeriod(
    DateTime start,
    DateTime end,
    MarineConditions conditions,
  ) {
    final periods = [
      ...conditions.majorPeriods,
      ...conditions.minorPeriods,
    ];

    return periods.any(
      (period) => start.isBefore(period.end) && end.isAfter(period.start),
    );
  }
}
