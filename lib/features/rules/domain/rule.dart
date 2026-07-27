import '../../knowledge/domain/evidence_level.dart';

import 'rule_action.dart';
import 'rule_condition.dart';

class Rule {
  final String id;

  final String name;

  final String species;

  final List<RuleCondition> conditions;

  final List<RuleAction> actions;

  final EvidenceLevel evidenceLevel;

  final double confidence;

  final int version;

  const Rule({
    required this.id,
    required this.name,
    required this.species,
    required this.conditions,
    required this.actions,
    required this.evidenceLevel,
    required this.confidence,
    required this.version,
  });
}