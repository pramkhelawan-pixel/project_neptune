import '../entities/fish_species.dart';

/// Determines Neptune's recommended bait.
class BaitRecommendationEngine {
  const BaitRecommendationEngine();

  String recommend(
      FishSpecies species,
      ) {
    switch (species.commonName) {
      case 'Kob':
        return 'Fresh Sardine';

      case 'Garrick':
        return 'Live Mullet';

      default:
        return 'Pilchard';
    }
  }
}