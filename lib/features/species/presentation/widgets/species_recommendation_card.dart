import 'package:flutter/material.dart';

import '../../domain/species_recommendation.dart';

class SpeciesRecommendationCard extends StatelessWidget {
  final SpeciesRecommendation recommendation;

  const SpeciesRecommendationCard({
    super.key,
    required this.recommendation,
  });

  Color _scoreColor(int score) {
    if (score >= 80) {
      return Colors.green;
    }

    if (score >= 60) {
      return Colors.orange;
    }

    return Colors.red;
  }

  String _rating(int score) {
    if (score >= 80) {
      return 'Excellent';
    }

    if (score >= 60) {
      return 'Good';
    }

    if (score >= 40) {
      return 'Fair';
    }

    return 'Poor';
  }

  @override
  Widget build(BuildContext context) {
    final color = _scoreColor(recommendation.score);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today\'s Best Species',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                const Text(
                  '🥇',
                  style: TextStyle(fontSize: 32),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        recommendation.species.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        recommendation.species.scientificName,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall,
                      ),
                    ],
                  ),
                ),

                CircleAvatar(
                  radius: 28,
                  backgroundColor: color,
                  child: Text(
                    '${recommendation.score}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              _rating(recommendation.score),
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 18),

            const Divider(),

            const SizedBox(height: 10),

            const Text(
              'Why?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 10),

            ...recommendation.reasons.map(
                  (reason) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Row(
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

            const SizedBox(height: 18),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.phishing),
              title: const Text('Recommended Lure'),
              subtitle: Text(
                recommendation.species.recommendedLure,
              ),
            ),

            ListTile(
              leading: const Icon(Icons.set_meal),
              title: const Text('Recommended Bait'),
              subtitle: Text(
                recommendation.species.recommendedBait,
              ),
            ),
          ],
        ),
      ),
    );
  }
}