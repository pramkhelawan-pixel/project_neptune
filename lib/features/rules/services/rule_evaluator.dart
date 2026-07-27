import '../domain/rule.dart';
import 'rule_result.dart';

class RuleEvaluator {
  const RuleEvaluator();

  RuleResult evaluate(
      Rule rule,
      bool matched,
      ) {
    if (!matched) {
      return const RuleResult(
        matched: false,
        weight: 0,
        explanation: '',
      );
    }

    final totalWeight = rule.actions.fold(
      0,
          (sum, action) => sum + action.weight,
    );

    final explanation = rule.actions
        .map((action) => action.explanation)
        .join('\n');

    return RuleResult(
      matched: true,
      weight: totalWeight,
      explanation: explanation,
    );
  }
}