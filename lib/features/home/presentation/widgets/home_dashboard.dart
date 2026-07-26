import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../marine/presentation/providers/marine_provider.dart';
import '../../../readiness/domain/readiness_engine.dart';
import 'marine_conditions_card.dart';
import 'readiness_card.dart';

class HomeDashboard extends ConsumerWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marineAsync = ref.watch(marineConditionsProvider);

    return marineAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Unable to load marine conditions.\n\n$error',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      data: (conditions) {
        final result = const ReadinessEngine().calculate(conditions);

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
                  result: result,
                ),

                const SizedBox(height: 20),

                MarineConditionsCard(
                  conditions: conditions,
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}