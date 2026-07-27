class Rule {
  final String id;

  final String species;

  final String topic;

  final String condition;

  final int weight;

  final String explanation;

  const Rule({
    required this.id,
    required this.species,
    required this.topic,
    required this.condition,
    required this.weight,
    required this.explanation,
  });
}