class RuleResult {
  final bool matched;
  final int weight;
  final String explanation;

  const RuleResult({
    required this.matched,
    required this.weight,
    required this.explanation,
  });
}