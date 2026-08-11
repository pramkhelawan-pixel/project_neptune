import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../marine/presentation/providers/marine_provider.dart';
import '../../../outlook/domain/fishing_outlook_engine.dart';
import '../../../outlook/presentation/widgets/fishing_outlook_card.dart';
import '../../../readiness/domain/readiness_engine.dart';
import '../../../recommendation/presentation/providers/recommendation_provider.dart';
import '../../../recommendation/presentation/widgets/neptune_recommendation_card.dart';
import '../../../species/domain/species_engine.dart';
import '../../../species/presentation/widgets/species_recommendation_card.dart';
import 'marine_conditions_card.dart';
import 'readiness_card.dart';

class HomeDashboard extends ConsumerWidget {
  const HomeDashboard({super.key});

  String _greeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return '🌊 Good Morning';
    }

    if (hour >= 12 && hour < 17) {
      return '🌊 Good Afternoon';
    }

    return '🌊 Good Evening';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marineAsync = ref.watch(marineConditionsProvider);
    final recommendationAsync = ref.watch(recommendationProvider);

    return marineAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Unable to load marine conditions.\n\n$error',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      data: (conditions) {
        final readiness =
        const ReadinessEngine().calculate(conditions);

        final outlook =
        const FishingOutlookEngine().generate(conditions);

        final speciesRecommendation =
        const SpeciesEngine().recommend(conditions);

        final theme = Theme.of(context);

        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _greeting(),
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
                  result: readiness,
                ),

                const SizedBox(height: 20),

                SpeciesRecommendationCard(
                  recommendation: speciesRecommendation,
                ),

                const SizedBox(height: 20),

                recommendationAsync.when(
                  loading: () => const Card(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  error: (error, stackTrace) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'Unable to generate recommendation.\n\n$error',
                      ),
                    ),
                  ),
                  data: (recommendation) =>
                      NeptuneRecommendationCard(
                        recommendation: recommendation,
                      ),
                ),

                const SizedBox(height: 20),

                FishingOutlookCard(
                  outlook: outlook,
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