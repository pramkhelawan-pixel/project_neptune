import 'package:flutter/material.dart';

import '../../../../core/theme/pelav_colors.dart';
import '../../domain/fishing_outlook.dart';

class FishingOutlookCard extends StatelessWidget {
  final FishingOutlook outlook;

  const FishingOutlookCard({
    super.key,
    required this.outlook,
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
              "Today's Fishing Outlook",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              outlook.summary,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 12),

            const Text(
              "Highlights",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...outlook.highlights.map(
                  (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: colors.success,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(item),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 12),

            Row(
              children: [
                Icon(Icons.schedule, color: colors.primaryForeground),
                const SizedBox(width: 10),
                const Text(
                  'Best Window',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(outlook.bestWindow),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Icon(Icons.analytics, color: colors.primaryForeground),
                const SizedBox(width: 10),
                const Text(
                  'Confidence',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text('${outlook.confidence}%'),
              ],
            ),

            const SizedBox(height: 8),

            const Text(
              'Reflects how well current wind, swell and tide match '
              'favourable fishing conditions -- not a chance of catching fish.',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}