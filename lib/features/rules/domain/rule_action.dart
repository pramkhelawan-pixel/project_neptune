class RuleAction {
  final String type;

  final String target;

  final int weight;

  final String explanation;

  const RuleAction({
    required this.type,
    required this.target,
    required this.weight,
    required this.explanation,
  });
}