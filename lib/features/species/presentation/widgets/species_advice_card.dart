import 'package:flutter/material.dart';

import '../../domain/entities/species_advice.dart';

class SpeciesAdviceCard extends StatelessWidget {
  final SpeciesAdvice advice;

  const SpeciesAdviceCard({
    super.key,
    required this.advice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              advice.species.commonName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Confidence: ${advice.confidence}%',
            ),
            Text(
              'Bait: ${advice.bait}',
            ),
            Text(
              'Rig: ${advice.rig}',
            ),
          ],
        ),
      ),
    );
  }
}