import 'package:flutter/material.dart';

import '../../../../core/theme/pelav_colors.dart';
import '../../domain/environmental_readiness.dart';

class EnvironmentalBreakdownCard extends StatelessWidget {
  final EnvironmentalReadiness readiness;

  const EnvironmentalBreakdownCard({
    super.key,
    required this.readiness,
  });

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Environmental Analysis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Strengths',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            if (readiness.strengths.isEmpty)
              const Text(
                'No environmental strengths identified.',
              )
            else
              ...readiness.strengths.map(
                    (item) => ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.check_circle,
                    color: colors.success,
                  ),
                  title: Text(item),
                ),
              ),

            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 20),

            const Text(
              'Weaknesses',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            if (readiness.weaknesses.isEmpty)
              const Text(
                'No environmental weaknesses identified.',
              )
            else
              ...readiness.weaknesses.map(
                    (item) => ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.warning_amber_rounded,
                    color: colors.warning,
                  ),
                  title: Text(item),
                ),
              ),
          ],
        ),
      ),
    );
  }
}