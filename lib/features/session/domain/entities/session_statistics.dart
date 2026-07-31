// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: session_statistics.dart
//
// Purpose:
// Stores calculated statistics for a completed fishing session.
//
// SessionStatistics provides the analytical foundation for Neptune's
// Analytics Engine, Learning Engine and Recommendation Engine.
//
// Statistics are calculated from catches and session activity rather than
// entered manually by the user.
// -----------------------------------------------------------------------------

/// Represents calculated statistics for a fishing session.
class SessionStatistics {
  /// Total duration of the fishing session.
  final Duration sessionDuration;

  /// Number of fish landed.
  final int fishCaught;

  /// Number of fish lost.
  final int fishLost;

  /// Number of different species landed.
  final int speciesCount;

  /// Total weight of all landed fish.
  final double totalWeightKg;

  /// Average fish weight.
  final double averageWeightKg;

  /// Largest fish landed.
  final double largestFishKg;

  /// Longest fish landed.
  final double longestFishCm;

  /// Creates immutable session statistics.
  const SessionStatistics({
    required this.sessionDuration,
    this.fishCaught = 0,
    this.fishLost = 0,
    this.speciesCount = 0,
    this.totalWeightKg = 0,
    this.averageWeightKg = 0,
    this.largestFishKg = 0,
    this.longestFishCm = 0,
  });

  /// Returns true when at least one fish was landed.
  bool get hasCatch => fishCaught > 0;

  /// Total number of fish interactions.
  int get totalHookups => fishCaught + fishLost;

  /// Landing success percentage.
  double get landingSuccessRate {
    if (totalHookups == 0) {
      return 0;
    }

    return (fishCaught / totalHookups) * 100;
  }

  /// Average fish caught per hour.
  double get catchRatePerHour {
    if (sessionDuration.inMinutes == 0) {
      return 0;
    }

    final hours = sessionDuration.inMinutes / 60;

    return fishCaught / hours;
  }

  /// Creates a modified copy.
  SessionStatistics copyWith({
    Duration? sessionDuration,
    int? fishCaught,
    int? fishLost,
    int? speciesCount,
    double? totalWeightKg,
    double? averageWeightKg,
    double? largestFishKg,
    double? longestFishCm,
  }) {
    return SessionStatistics(
      sessionDuration:
      sessionDuration ?? this.sessionDuration,
      fishCaught: fishCaught ?? this.fishCaught,
      fishLost: fishLost ?? this.fishLost,
      speciesCount: speciesCount ?? this.speciesCount,
      totalWeightKg:
      totalWeightKg ?? this.totalWeightKg,
      averageWeightKg:
      averageWeightKg ?? this.averageWeightKg,
      largestFishKg:
      largestFishKg ?? this.largestFishKg,
      longestFishCm:
      longestFishCm ?? this.longestFishCm,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SessionStatistics &&
        other.sessionDuration == sessionDuration &&
        other.fishCaught == fishCaught &&
        other.fishLost == fishLost &&
        other.speciesCount == speciesCount &&
        other.totalWeightKg == totalWeightKg &&
        other.averageWeightKg == averageWeightKg &&
        other.largestFishKg == largestFishKg &&
        other.longestFishCm == longestFishCm;
  }

  @override
  int get hashCode => Object.hash(
    sessionDuration,
    fishCaught,
    fishLost,
    speciesCount,
    totalWeightKg,
    averageWeightKg,
    largestFishKg,
    longestFishCm,
  );

  @override
  String toString() {
    return 'SessionStatistics('
        'fishCaught: $fishCaught, '
        'fishLost: $fishLost, '
        'speciesCount: $speciesCount, '
        'totalWeightKg: $totalWeightKg'
        ')';
  }
}