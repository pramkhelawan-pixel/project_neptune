// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: observation_metadata.dart
//
// Purpose:
// Immutable value object describing metadata associated with a marine
// observation.
//
// ObservationMetadata records when observations were captured, their source
// and the confidence assigned to the observation.
//
// -----------------------------------------------------------------------------

class ObservationMetadata {
  /// Date and time the observation was made.
  final DateTime observedAt;

  /// Date and time the forecast or observation was published.
  final DateTime publishedAt;

  /// Data provider.
  ///
  /// Examples:
  /// - Open-Meteo
  /// - SA Weather Service
  /// - Windguru
  /// - Neptune Manual Observation
  final String provider;

  /// Confidence expressed as a percentage (0–100).
  final double confidence;

  const ObservationMetadata({
    required this.observedAt,
    required this.publishedAt,
    required this.provider,
    required this.confidence,
  });

  /// Returns true when the observation is considered highly reliable.
  bool get isHighConfidence => confidence >= 90.0;

  /// Returns true when the observation is considered recent.
  bool get isRecent =>
      DateTime.now().difference(observedAt).inHours <= 6;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ObservationMetadata &&
        other.observedAt == observedAt &&
        other.publishedAt == publishedAt &&
        other.provider == provider &&
        other.confidence == confidence;
  }

  @override
  int get hashCode => Object.hash(
    observedAt,
    publishedAt,
    provider,
    confidence,
  );

  @override
  String toString() {
    return 'ObservationMetadata('
        'provider: $provider, '
        'confidence: ${confidence.toStringAsFixed(0)}%, '
        'observedAt: $observedAt'
        ')';
  }
}