import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../location/presentation/providers/user_location_provider.dart';
import '../../../marine/presentation/providers/marine_provider.dart';
import '../../../outlook/domain/fishing_outlook_engine.dart';
import '../../../outlook/presentation/widgets/fishing_outlook_card.dart';
import '../../../profile/presentation/providers/profile_repository_provider.dart';
import '../../../readiness/domain/readiness_engine.dart';
import '../../../recommendation/data/species_environment_profiles.dart';
import '../../../recommendation/domain/species_environment_profile.dart';
import '../../../recommendation/presentation/providers/recommendation_provider.dart';
import '../../../recommendation/presentation/widgets/best_fishing_window_card.dart';
import '../../../recommendation/presentation/widgets/neptune_recommendation_card.dart';
import '../../../recommendation/services/best_fishing_window_engine.dart';
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

  /// Looks up the environment profile for [species], falling back to Shad
  /// -- mirrors the existing lookup in `RecommendationSeedProvider`, kept
  /// separate rather than reusing that class directly since it is scoped
  /// to seeding bait/hook/leader recommendations, not window evaluation.
  SpeciesEnvironmentProfile _profileForSpecies(String species) {
    return environmentProfiles.firstWhere(
      (profile) => profile.species.toLowerCase() == species.toLowerCase(),
      orElse: () => shadEnvironmentProfile,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marineAsync = ref.watch(marineConditionsProvider);
    final recommendationAsync = ref.watch(recommendationProvider);

    // Only an explicit `true` unlocks the Solunar tiebreak below -- loading,
    // null-profile, and lookup-failure cases all fall through to `false`,
    // matching the same fail-closed pattern already used by
    // MarineConditionsCard's Solunar gate.
    final isPremium =
        ref.watch(currentProfileProvider).valueOrNull?.isPremium ?? false;

    return marineAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Unable to load marine conditions.\n\n$error',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Recovers from a failed/denied/timed-out GPS resolution
              // (e.g. a slow first-run permission dialog) without ever
              // falling back to a fixed location — mirrors the retry
              // pattern already used by Maps' locate FAB.
              ElevatedButton(
                onPressed: () => ref.invalidate(userLocationProvider),
                child: const Text('Try Again'),
              ),
            ],
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
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  error: (error, stackTrace) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Unable to generate recommendation.\n\n$error',
                      ),
                    ),
                  ),
                  data: (recommendation) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      NeptuneRecommendationCard(
                        recommendation: recommendation,
                      ),
                      const SizedBox(height: 20),
                      BestFishingWindowCard(
                        result: const BestFishingWindowEngine().evaluate(
                          conditions: conditions,
                          profile: _profileForSpecies(recommendation.species),
                          includeSolunarTiebreak: isPremium,
                        ),
                      ),
                    ],
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