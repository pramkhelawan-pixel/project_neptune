// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: session_equipment.dart
//
// Purpose:
// Represents the complete fishing equipment configuration used during a
// fishing session.
//
// Rather than storing descriptive text, Neptune stores Knowledge IDs that
// reference the Knowledge Engine. This prevents duplication and enables
// analytics, reporting and future AI learning.
//
// Future versions may extend this entity with multiple rods, lure changes,
// trace changes and equipment timelines.
// -----------------------------------------------------------------------------

/// Represents the equipment configuration used during a fishing session.
class SessionEquipment {
  /// Rod knowledge identifier.
  final String rodId;

  /// Reel knowledge identifier.
  final String reelId;

  /// Main line knowledge identifier.
  final String mainLineId;

  /// Leader knowledge identifier.
  final String leaderId;

  /// Trace knowledge identifier.
  final String traceId;

  /// Hook knowledge identifier.
  final String hookId;

  /// Sinker knowledge identifier.
  final String sinkerId;

  /// Primary bait knowledge identifier.
  final String baitId;

  /// Optional lure knowledge identifier.
  final String? lureId;

  /// Creates an immutable equipment configuration.
  const SessionEquipment({
    required this.rodId,
    required this.reelId,
    required this.mainLineId,
    required this.leaderId,
    required this.traceId,
    required this.hookId,
    required this.sinkerId,
    required this.baitId,
    this.lureId,
  });

  /// Returns true when a lure was used.
  bool get hasLure =>
      lureId != null &&
          lureId!.trim().isNotEmpty;

  /// Returns true when natural bait was used.
  bool get usesNaturalBait => baitId.isNotEmpty;

  /// Creates a copy with updated values.
  SessionEquipment copyWith({
    String? rodId,
    String? reelId,
    String? mainLineId,
    String? leaderId,
    String? traceId,
    String? hookId,
    String? sinkerId,
    String? baitId,
    String? lureId,
  }) {
    return SessionEquipment(
      rodId: rodId ?? this.rodId,
      reelId: reelId ?? this.reelId,
      mainLineId: mainLineId ?? this.mainLineId,
      leaderId: leaderId ?? this.leaderId,
      traceId: traceId ?? this.traceId,
      hookId: hookId ?? this.hookId,
      sinkerId: sinkerId ?? this.sinkerId,
      baitId: baitId ?? this.baitId,
      lureId: lureId ?? this.lureId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SessionEquipment &&
        other.rodId == rodId &&
        other.reelId == reelId &&
        other.mainLineId == mainLineId &&
        other.leaderId == leaderId &&
        other.traceId == traceId &&
        other.hookId == hookId &&
        other.sinkerId == sinkerId &&
        other.baitId == baitId &&
        other.lureId == lureId;
  }

  @override
  int get hashCode => Object.hash(
    rodId,
    reelId,
    mainLineId,
    leaderId,
    traceId,
    hookId,
    sinkerId,
    baitId,
    lureId,
  );

  @override
  String toString() {
    return 'SessionEquipment('
        'rodId: $rodId, '
        'reelId: $reelId, '
        'mainLineId: $mainLineId, '
        'leaderId: $leaderId, '
        'traceId: $traceId, '
        'hookId: $hookId, '
        'sinkerId: $sinkerId, '
        'baitId: $baitId, '
        'lureId: $lureId'
        ')';
  }
}