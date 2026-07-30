class CatchRecord {
  final String id;
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

  const CatchRecord({
    required this.id,
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

  CatchRecord copyWith({
    String? id,
    DateTime? dateTime,
    String? species,
    String? location,
    double? weightKg,
    double? lengthCm,
    String? bait,
    String? hook,
    String? trace,
    String? notes,
    String? photoPath,
  }) {
    return CatchRecord(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      species: species ?? this.species,
      location: location ?? this.location,
      weightKg: weightKg ?? this.weightKg,
      lengthCm: lengthCm ?? this.lengthCm,
      bait: bait ?? this.bait,
      hook: hook ?? this.hook,
      trace: trace ?? this.trace,
      notes: notes ?? this.notes,
      photoPath: photoPath ?? this.photoPath,
    );
  }
}