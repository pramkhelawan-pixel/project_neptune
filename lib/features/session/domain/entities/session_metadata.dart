// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: session_metadata.dart
//
// Purpose:
// Stores technical metadata associated with a Fishing Session.
//
// Metadata is managed automatically by Neptune and is never entered manually
// by the angler.
//
// It supports synchronisation, diagnostics, analytics, auditing and future
// cloud services without affecting the business domain.
// -----------------------------------------------------------------------------

/// Technical metadata for a fishing session.
class SessionMetadata {
  /// Date and time the session was created.
  final DateTime createdAt;

  /// Date and time the session was last modified.
  final DateTime updatedAt;

  /// Indicates whether the session has been synchronised.
  final bool isSynced;

  /// Date and time of the last successful synchronisation.
  final DateTime? lastSyncedAt;

  /// Version of Neptune that created the session.
  final String appVersion;

  /// Version of the Neptune Knowledge Base used.
  final String knowledgeVersion;

  /// Creates immutable session metadata.
  const SessionMetadata({
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
    this.lastSyncedAt,
    required this.appVersion,
    required this.knowledgeVersion,
  });

  /// Returns true if the session has been synchronised.
  bool get hasBeenSynced => isSynced;

  /// Creates a modified copy.
  SessionMetadata copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
    DateTime? lastSyncedAt,
    String? appVersion,
    String? knowledgeVersion,
  }) {
    return SessionMetadata(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      appVersion: appVersion ?? this.appVersion,
      knowledgeVersion:
      knowledgeVersion ?? this.knowledgeVersion,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SessionMetadata &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.isSynced == isSynced &&
        other.lastSyncedAt == lastSyncedAt &&
        other.appVersion == appVersion &&
        other.knowledgeVersion == knowledgeVersion;
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    isSynced,
    lastSyncedAt,
    appVersion,
    knowledgeVersion,
  );

  @override
  String toString() {
    return 'SessionMetadata('
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'isSynced: $isSynced, '
        'appVersion: $appVersion, '
        'knowledgeVersion: $knowledgeVersion'
        ')';
  }
}