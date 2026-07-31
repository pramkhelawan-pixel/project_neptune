import 'package:flutter/material.dart';

class RecommendationSummaryCard extends StatelessWidget {
  final String title;

  final String summary;

  const RecommendationSummaryCard({
    super.key,
    required this.title,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.auto_awesome,
        ),
        title: Text(title),
        subtitle: Text(summary),
      ),
    );
  }
}