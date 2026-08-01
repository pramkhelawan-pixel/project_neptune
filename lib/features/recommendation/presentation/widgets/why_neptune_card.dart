import 'package:flutter/material.dart';

import '../../domain/entities/recommendation_insight.dart';

/// Displays Neptune's reasoning behind today's recommendation.
class WhyNeptuneCard extends StatelessWidget {
  final List<RecommendationInsight> insights;

  const WhyNeptuneCard({
    super.key,
    required this.insights,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Why Neptune Thinks This',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...insights.map(
                  (insight) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  insight.positive
                      ? Icons.check_circle
                      : Icons.warning_amber,
                ),
                title: Text(insight.title),
                subtitle: Text(insight.description),
              ),
            ),
          ],
        ),
      ),
    );
  }
}