import 'package:flutter/material.dart';

import '../../../../core/theme/pelav_colors.dart';
import '../../domain/recommendation_response.dart';
import '../pages/recommendation_details_page.dart';

class NeptuneRecommendationCard extends StatelessWidget {
  final RecommendationResponse recommendation;

  const NeptuneRecommendationCard({
    super.key,
    required this.recommendation,
  });

  /// Confidence keeps its own independent 70/50 cutoffs (unchanged) --
  /// the former >=85 "bright green" tier is preserved as `success`, since
  /// only success/warning/critical are approved semantic status colours
  /// (no separate "successBright" token exists) and nothing else in this
  /// card branches on the removed 85 boundary.
  Color _confidenceColor(BuildContext context) {
    final colors = context.colors;
    if (recommendation.confidence >= 70) {
      return colors.success;
    }

    if (recommendation.confidence >= 50) {
      return colors.warning;
    }

    return colors.critical;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // Background/border/radius/elevation are inherited from CardThemeData
    // (surface1, 1px hairline, 18px radius, elevation 0) rather than
    // repeated here.
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '🎣 PELAV Recommendation',
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
                    color: _confidenceColor(context),
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
              color: _confidenceColor(context),
            ),

            const SizedBox(height: 8),

            const Text(
              'Reflects how well current conditions match this species\' '
              'known preferences -- not a chance of catching fish.',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 24),

            const Divider(),

            const SizedBox(height: 12),

            const Text(
              'Why PELAV Recommended This',
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
                    Icon(
                      Icons.check_circle,
                      color: colors.success,
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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RecommendationDetailsPage(
                      recommendation: recommendation,
                    ),
                  ),
                );
              },
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