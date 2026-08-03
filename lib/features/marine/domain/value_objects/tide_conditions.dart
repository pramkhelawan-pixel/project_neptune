// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: tide_conditions.dart
//
// Purpose:
// Immutable value object representing observed tidal conditions.
//
// TideConditions forms part of Neptune's canonical Marine Domain and is
// consumed by the Intelligence Engine when evaluating fishing conditions.
//
// -----------------------------------------------------------------------------

class TideConditions {
  /// Current tidal state.
  ///
  /// Examples:
  /// - Incoming
  /// - Outgoing
  /// - High
  /// - Low
  final String state;

  /// Tide height in metres.
  final double height;

  /// Time of the next high tide.
  final DateTime nextHigh;

  /// Time of the next low tide.
  final DateTime nextLow;

  const TideConditions({
    required this.state,
    required this.height,
    required this.nextHigh,
    required this.nextLow,
  });

  /// Returns true when the tide is incoming.
  bool get isIncoming =>
      state.toLowerCase() == 'incoming';

  /// Returns true when the tide is outgoing.
  bool get isOutgoing =>
      state.toLowerCase() == 'outgoing';

  /// Returns true when the tide is high.
  bool get isHigh =>
      state.toLowerCase() == 'high';

  /// Returns true when the tide is low.
  bool get isLow =>
      state.toLowerCase() == 'low';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TideConditions &&
        other.state == state &&
        other.height == height &&
        other.nextHigh == nextHigh &&
        other.nextLow == nextLow;
  }

  @override
  int get hashCode => Object.hash(
    state,
    height,
    nextHigh,
    nextLow,
  );

  @override
  String toString() {
    return 'TideConditions('
        'state: $state, '
        'height: ${height.toStringAsFixed(2)} m'
        ')';
  }
}