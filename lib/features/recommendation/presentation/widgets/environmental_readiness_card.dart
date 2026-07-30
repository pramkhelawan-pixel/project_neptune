import 'package:flutter/material.dart';

import '../../domain/environmental_readiness.dart';

class EnvironmentalReadinessCard extends StatelessWidget {
  final EnvironmentalReadiness readiness;

  const EnvironmentalReadinessCard({
    super.key,
    required this.readiness,
  });

  Color _statusColor() {
    if (readiness.score >= 90) {
      return Colors.green;
    }

    if (readiness.score >= 75) {
      return Colors.lightGreen;
    }

    if (readiness.score >= 60) {
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
                  color: _statusColor(),
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
                  color: _statusColor(),
                ),
              ),
            ),

            const SizedBox(height: 24),

            LinearProgressIndicator(
              value: readiness.score / 100,
              minHeight: 12,
              borderRadius: BorderRadius.circular(10),
              color: _statusColor(),
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
                  leading: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
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
                  leading: const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.orange,
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