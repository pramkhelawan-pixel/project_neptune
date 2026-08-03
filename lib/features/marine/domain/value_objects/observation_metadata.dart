// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: observation_metadata.dart
//
// Purpose:
// Immutable value object describing metadata associated with a marine
// observation.
//
// -----------------------------------------------------------------------------

class ObservationMetadata {
  final DateTime observedAt;
  final DateTime publishedAt;
  final String provider;
  final double confidence;

  const ObservationMetadata({
    required this.observedAt,
    required this.publishedAt,
    required this.provider,
    required this.confidence,
  });

  bool get isHighConfidence => confidence >= 90.0;

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