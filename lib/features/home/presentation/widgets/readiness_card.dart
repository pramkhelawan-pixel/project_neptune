import 'package:flutter/material.dart';

import '../../../readiness/domain/readiness_engine.dart';

class ReadinessCard extends StatelessWidget {
  final ReadinessResult result;

  const ReadinessCard({
    super.key,
    required this.result,
  });

  Color _scoreColor() {
    if (result.score >= 85) {
      return Colors.green;
    }

    if (result.score >= 70) {
      return Colors.lightGreen;
    }

    if (result.score >= 50) {
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
              'Neptune Readiness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: result.score / 100,
                    strokeWidth: 12,
                    color: _scoreColor(),
                    backgroundColor: Colors.grey.shade300,
                  ),
                  Center(
                    child: Text(
                      '${result.score}%',
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              result.rating,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _scoreColor(),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              result.recommendation,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

            const Divider(),

            const SizedBox(height: 8),

            const Text(
              'Why?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 12),

            ...result.reasons.map(
                  (reason) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
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

            const SizedBox(height: 20),

            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.insights),
              label: const Text('Detailed Analysis'),
            ),
          ],
        ),
      ),
    );
  }
}