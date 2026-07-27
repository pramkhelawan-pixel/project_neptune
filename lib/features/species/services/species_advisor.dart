import '../../marine/domain/models/marine_conditions.dart';
import 'species_advice.dart';

class SpeciesAdvisor {
  const SpeciesAdvisor();

  SpeciesAdvice advise(
      MarineConditions conditions,
      String species,
      ) {
    final weights = <int>[];
    final reasons = <String>[];

    String bait = 'Fresh Sardine';
    String bestTime = 'Sunrise';

    // Wind
    if (conditions.windSpeed <= 15) {
      weights.add(20);
      reasons.add('Light wind improves surf conditions.');
    } else {
      weights.add(5);
      reasons.add('Stronger winds reduce fishing quality.');
    }

    // Swell
    if (conditions.swellHeight >= 1.2 &&
        conditions.swellHeight <= 2.0) {
      weights.add(20);
      reasons.add('Moderate swell creates productive water movement.');
    }

    // Tide
    switch (conditions.tideState.toLowerCase()) {
      case 'incoming':
      case 'rising':
        weights.add(25);
        reasons.add('Incoming tide increases feeding activity.');
        break;

      case 'high':
        weights.add(15);
        reasons.add('High tide provides good opportunities.');
        break;

      default:
        weights.add(5);
        reasons.add('Less favourable tide stage.');
    }

    return SpeciesAdvice(
      species: species,
      bait: bait,
      bestTime: bestTime,
      weights: weights,
      reasons: reasons,
    );
  }
}