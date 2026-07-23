import 'package:flutter/material.dart';

import '../../../marine/domain/models/marine_conditions.dart';
import '../../../marine/domain/services/readiness_engine.dart';
import 'marine_conditions_card.dart';
import 'readiness_card.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final conditions = MarineConditions(
      windSpeed: 14,
      windDirection: 'NE',
      swellHeight: 1.8,
      swellPeriod: 12,
      tide: 'Rising',
      moonPhase: 'Waxing Gibbous',
      sunrise: DateTime(2026, 7, 23, 6, 21),
      sunset: DateTime(2026, 7, 23, 17, 18),
    );

    final engine = ReadinessEngine();

    final score = engine.calculate(conditions);

    String status;

    if (score >= 80) {
      status = 'Excellent fishing conditions';
    } else if (score >= 60) {
      status = 'Good fishing conditions';
    } else if (score >= 40) {
      status = 'Fair fishing conditions';
    } else {
      status = 'Poor fishing conditions';
    }

    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🌊 Good Evening',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Ready for your next adventure?',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ReadinessCard(
              score: score,
              status: status,
            ),
            const SizedBox(height: 20),
            const MarineConditionsCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}