import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/best_fishing_window_engine.dart';

/// Displays Neptune's Best Fishing Window for the current session.
///
/// Shows a qualitative readiness label (Excellent/Very Good/Good/Fair/
/// Poor/Very Poor, from the existing `ConfidenceEngine.readinessLevel`
/// scale) -- deliberately never a percentage, and never a claim about the
/// probability of catching fish. See [BestFishingWindowEngine].
class BestFishingWindowCard extends StatelessWidget {
  final BestFishingWindowResult result;

  const BestFishingWindowCard({
    super.key,
    required this.result,
  });

  String _formatRange(DateTime start, DateTime end) {
    final formatter = DateFormat('HH:mm');
    return '${formatter.format(start.toLocal())} – ${formatter.format(end.toLocal())}';
  }

  Color _levelColor(String level) {
    switch (level) {
      case 'Excellent':
      case 'Very Good':
        return Colors.green;
      case 'Good':
        return Colors.lightGreen;
      case 'Fair':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final best = result.best;

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
              '🎣 Best Fishing Window',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (best == null)
              const Text(
                'No suitable fishing window available right now.',
                textAlign: TextAlign.center,
              )
            else ...[
              Text(
                _formatRange(best.start, best.end),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Conditions: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    best.qualitativeLevel,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _levelColor(best.qualitativeLevel),
                    ),
                  ),
                ],
              ),
              if (best.reasons.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
                const Text(
                  'Why',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...best.reasons.map(
                  (reason) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: Text(reason)),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
