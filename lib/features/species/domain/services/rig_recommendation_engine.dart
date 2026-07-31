import '../entities/fish_species.dart';

/// Determines Neptune's recommended rig.
class RigRecommendationEngine {
  const RigRecommendationEngine();

  String recommend(
      FishSpecies species,
      ) {
    switch (species.commonName) {
      case 'Kob':
        return '2/0 Kendal with 0.55 mm leader';

      case 'Garrick':
        return 'Live-bait slide rig';

      default:
        return 'Standard surf rig';
    }
  }
}