/// Recommended hook specification.
class HookRecommendation {
  final String size;

  final String pattern;

  const HookRecommendation({
    required this.size,
    required this.pattern,
  });

  @override
  String toString() => '$size $pattern';
}