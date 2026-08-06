import 'package:equatable/equatable.dart';

/// Root DTO returned by the WorldTides API.
class TideDto extends Equatable {
  final int status;
  final String station;
  final String? error;
  final List<TideHeightDto> heights;
  final List<TideExtremeDto> extremes;

  const TideDto({
    required this.status,
    required this.station,
    this.error,
    required this.heights,
    required this.extremes,
  });

  factory TideDto.fromJson(Map<String, dynamic> json) {
    return TideDto(
      status: json['status'] as int? ?? 0,
      station: json['station'] as String? ?? '',
      error: json['error'] as String?,
      heights: (json['heights'] as List<dynamic>? ?? [])
          .map(
            (item) => TideHeightDto.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
      extremes: (json['extremes'] as List<dynamic>? ?? [])
          .map(
            (item) => TideExtremeDto.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
    status,
    station,
    error,
    heights,
    extremes,
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
