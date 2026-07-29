import 'package:flutter/material.dart';

import '../../domain/recommendation_response.dart';

class NeptuneRecommendationCard extends StatelessWidget {
  final RecommendationResponse recommendation;

  const NeptuneRecommendationCard({
    super.key,
    required this.recommendation,
  });

  Color _confidenceColor() {
    if (recommendation.confidence >= 85) {
      return Colors.green;
    }

    if (recommendation.confidence >= 70) {
      return Colors.lightGreen;
    }

    if (recommendation.confidence >= 50) {
      return Colors.orange;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '🎣 Neptune Recommendation',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            _InfoRow(
              label: 'Species',
              value: recommendation.species,
            ),

            const SizedBox(height: 12),

            _InfoRow(
              label: 'Recommended Bait',
              value: recommendation.bait,
            ),

            const SizedBox(height: 12),

            _InfoRow(
              label: 'Recommended Hook',
              value: recommendation.hook,
            ),

            const SizedBox(height: 12),

            _InfoRow(
              label: 'Leader',
              value: recommendation.leader,
            ),

            const SizedBox(height: 12),

            _InfoRow(
              label: 'Presentation',
              value: recommendation.presentation,
            ),

            const SizedBox(height: 12),

            _InfoRow(
              label: 'Best Time',
              value: recommendation.bestTime,
            ),

            const SizedBox(height: 12),

            _InfoRow(
              label: 'Location',
              value: recommendation.location,
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Confidence',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${recommendation.confidence.toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: _confidenceColor(),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            LinearProgressIndicator(
              value: recommendation.confidence / 100.0,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
              color: _confidenceColor(),
            ),

            const SizedBox(height: 24),

            const Divider(),

            const SizedBox(height: 12),

            const Text(
              'Why Neptune Recommended This',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...recommendation.explanations.map(
                  (reason) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(reason),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.psychology,
              ),
              label: const Text(
                'View Recommendation Details',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}