import '../entities/fish_species.dart';
import '../entities/hook_recommendation.dart';

/// Determines the recommended hook for a species.
class HookRecommendationEngine {
  const HookRecommendationEngine();

  HookRecommendation recommend(
      FishSpecies species,
      ) {
    switch (species.commonName) {
      case 'Kob':
        return const HookRecommendation(
          size: '2/0',
          pattern: 'Kendal Round',
        );

      case 'Garrick':
        return const HookRecommendation(
          size: '6/0',
          pattern: 'Circle Hook',
        );

      case 'Galjoen':
        return const HookRecommendation(
          size: '1/0',
          pattern: 'Baitholder',
        );

      default:
        return const HookRecommendation(
          size: '2/0',
          pattern: 'General Purpose',
        );
    }
  }
}