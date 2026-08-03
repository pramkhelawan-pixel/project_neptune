// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: tide_state.dart
//
// Purpose:
// Defines the canonical tidal states used throughout Neptune.
//
// This enum replaces raw String values and provides compile-time safety and
// consistent terminology across the platform.
//
// -----------------------------------------------------------------------------

enum TideState {
  low(
    displayName: 'Low Tide',
  ),

  incoming(
    displayName: 'Incoming Tide',
  ),

  high(
    displayName: 'High Tide',
  ),

  outgoing(
    displayName: 'Outgoing Tide',
  );

  /// Human-readable name.
  final String displayName;

  const TideState({
    required this.displayName,
  });

  /// Returns true if the tide is moving toward high tide.
  bool get isIncoming => this == TideState.incoming;

  /// Returns true if the tide is moving toward low tide.
  bool get isOutgoing => this == TideState.outgoing;

  /// Returns true if the tide is currently high.
  bool get isHigh => this == TideState.high;

  /// Returns true if the tide is currently low.
  bool get isLow => this == TideState.low;

  /// Returns true if water is moving.
  bool get isRunning => isIncoming || isOutgoing;

  /// Returns true if the tide is at slack water.
  bool get isSlack => isHigh || isLow;

  @override
  String toString() => displayName;
}