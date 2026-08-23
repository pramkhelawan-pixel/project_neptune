/// A single Solunar feeding window — a major (moon transit/antitransit) or
/// minor (moonrise/moonset) period.
class SolunarPeriod {
  final DateTime start;
  final DateTime end;

  const SolunarPeriod({
    required this.start,
    required this.end,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SolunarPeriod &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode => Object.hash(start, end);

  @override
  String toString() => 'SolunarPeriod(start: $start, end: $end)';
}
