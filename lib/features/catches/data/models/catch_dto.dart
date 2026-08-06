/// Row shape for the Supabase `catches` table.
class CatchDto {
  final String id;
  final String userId;
  final String sessionId;
  final DateTime dateTime;
  final String species;
  final String location;
  final double? weightKg;
  final double? lengthCm;
  final String bait;
  final String hook;
  final String trace;
  final String notes;
  final String? photoPath;

  const CatchDto({
    required this.id,
    required this.userId,
    required this.sessionId,
    required this.dateTime,
    required this.species,
    required this.location,
    this.weightKg,
    this.lengthCm,
    required this.bait,
    required this.hook,
    required this.trace,
    required this.notes,
    this.photoPath,
  });

  factory CatchDto.fromJson(Map<String, dynamic> json) {
    return CatchDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      species: json['species'] as String,
      location: json['location'] as String,
      weightKg: (json['weight_kg'] as num?)?.toDouble(),
      lengthCm: (json['length_cm'] as num?)?.toDouble(),
      bait: json['bait'] as String,
      hook: json['hook'] as String,
      trace: json['trace'] as String,
      notes: json['notes'] as String,
      photoPath: json['photo_path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'session_id': sessionId,
      'date_time': dateTime.toIso8601String(),
      'species': species,
      'location': location,
      'weight_kg': weightKg,
      'length_cm': lengthCm,
      'bait': bait,
      'hook': hook,
      'trace': trace,
      'notes': notes,
      'photo_path': photoPath,
    };
  }
}
