import 'rule_operator.dart';

class RuleCondition {
  final String field;

  final RuleOperator operator;

  final dynamic value;

  const RuleCondition({
    required this.field,
    required this.operator,
    required this.value,
  });
}