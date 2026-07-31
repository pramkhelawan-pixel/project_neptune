import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mappers/species_recommendation_mapper.dart';
import '../providers/daily_recommendation_provider.dart';
import '../widgets/species_recommendation_tile.dart';

class DailyRecommendationPage extends ConsumerWidget {
  const DailyRecommendationPage({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    const mapper = SpeciesRecommendationMapper();

    final recommendation =
    ref.watch(dailyRecommendationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today's Fishing",
        ),
      ),
      body: recommendation.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Unable to load recommendations.\n\n$error',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        data: (dailyRecommendation) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount:
            dailyRecommendation.recommendations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: SpeciesRecommendationTile(
                  recommendation: mapper.map(
                    dailyRecommendation
                        .recommendations[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}