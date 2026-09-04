import 'package:flutter/material.dart';

import '../../../../core/theme/pelav_colors.dart';
import '../../domain/environmental_readiness.dart';

class EnvironmentalReadinessCard extends StatelessWidget {
  final EnvironmentalReadiness readiness;

  const EnvironmentalReadinessCard({
    super.key,
    required this.readiness,
  });

  /// Preserves the existing 90/75/60 cutoffs exactly; only the emitted
  /// colour now comes from the three approved semantic tokens instead of
  /// raw Material colours -- the 75-89 band collapses into `success`
  /// alongside >=90, since no separate "successBright" token is approved.
  Color _statusColor(BuildContext context) {
    final colors = context.colors;
    if (readiness.score >= 75) {
      return colors.success;
    }

    if (readiness.score >= 60) {
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
              '🌊 Environmental Readiness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: Text(
                '${readiness.score}%',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: _statusColor(context),
                ),
              ),
            ),

            const SizedBox(height: 8),

            Center(
              child: Text(
                readiness.level,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: _statusColor(context),
                ),
              ),
            ),

            const SizedBox(height: 24),

            LinearProgressIndicator(
              value: readiness.score / 100,
              minHeight: 12,
              borderRadius: BorderRadius.circular(10),
              color: _statusColor(context),
            ),

            const SizedBox(height: 12),

            const Text(
              'Based on the same wind, swell, tide, moon and temperature '
              'match used to calculate the recommendation above -- not a '
              'separate or independent measurement.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 24),

            const Divider(),

            const SizedBox(height: 12),

            const Text(
              'Environmental Strengths',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            if (readiness.strengths.isEmpty)
              const Text('No strengths identified.')
            else
              ...readiness.strengths.map(
                    (strength) => ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.check_circle,
                    color: colors.success,
                  ),
                  title: Text(strength),
                ),
              ),

            const SizedBox(height: 20),

            const Text(
              'Environmental Weaknesses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            if (readiness.weaknesses.isEmpty)
              const Text('No significant weaknesses.')
            else
              ...readiness.weaknesses.map(
                    (weakness) => ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.warning_amber_rounded,
                    color: colors.warning,
                  ),
                  title: Text(weakness),
                ),
              ),
          ],
        ),
      ),
    );
  }
}