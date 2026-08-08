import 'package:equatable/equatable.dart';

/// Root DTO returned by the WorldTides API, as unwrapped from the
/// get-tides Edge Function's cache envelope (`{data, source, warning,
/// last_updated}` — see `supabase/functions/get-tides/index.ts`).
class TideDto extends Equatable {
  final int status;
  final String station;
  final String? error;
  final List<TideHeightDto> heights;
  final List<TideExtremeDto> extremes;

  /// How this response was served: "fresh" (WorldTides was just called),
  /// "cache" (served from a non-expired cache row), or "stale_fallback"
  /// (WorldTides was unavailable; an expired cache row was served instead).
  final String source;

  /// Set only when [source] is "stale_fallback" — a user-facing explanation
  /// of why the data may be out of date.
  final String? warning;

  const TideDto({
    required this.status,
    required this.station,
    this.error,
    required this.heights,
    required this.extremes,
    required this.source,
    this.warning,
  });

  factory TideDto.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};

    return TideDto(
      status: data['status'] as int? ?? 0,
      station: data['station'] as String? ?? '',
      error: data['error'] as String?,
      heights: (data['heights'] as List<dynamic>? ?? [])
          .map(
            (item) => TideHeightDto.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
      extremes: (data['extremes'] as List<dynamic>? ?? [])
          .map(
            (item) => TideExtremeDto.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
      source: json['source'] as String? ?? 'unknown',
      warning: json['warning'] as String?,
    );
  }

  @override
  List<Object?> get props => [
    status,
    station,
    error,
    heights,
    extremes,
    source,
    warning,
  ];
}

/// Individual tide height prediction.
class TideHeightDto extends Equatable {
  final int unixTime;
  final DateTime dateTime;
  final double height;

  const TideHeightDto({
    required this.unixTime,
    required this.dateTime,
    required this.height,
  });

  factory TideHeightDto.fromJson(
      Map<String, dynamic> json,
      ) {
    return TideHeightDto(
      unixTime: json['dt'] as int? ?? 0,
      dateTime: DateTime.parse(
        json['date'] as String,
      ),
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
    );
  }

  @override
  List<Object?> get props => [
    unixTime,
    dateTime,
    height,
  ];
}

/// High/Low tide event.
class TideExtremeDto extends Equatable {
  final int unixTime;
  final DateTime dateTime;
  final double height;
  final String type;

  const TideExtremeDto({
    required this.unixTime,
    required this.dateTime,
    required this.height,
    required this.type,
  });

  factory TideExtremeDto.fromJson(
      Map<String, dynamic> json,
      ) {
    return TideExtremeDto(
      unixTime: json['dt'] as int? ?? 0,
      dateTime: DateTime.parse(
        json['date'] as String,
      ),
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      type: json['type'] as String? ?? '',
    );
  }

  bool get isHigh =>
      type.toLowerCase() == 'high';

  bool get isLow =>
      type.toLowerCase() == 'low';

  @override
  List<Object?> get props => [
    unixTime,
    dateTime,
    height,
    type,
  ];
}
