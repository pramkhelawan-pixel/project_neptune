import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../marine/domain/models/marine_conditions.dart';

import '../../domain/entities/daily_species_recommendation.dart';
import '../../domain/services/daily_recommendation_service.dart';

/// Temporary provider until live marine data is connected.
final dailyRecommendationProvider =
Provider<DailySpeciesRecommendation>((ref) {
  const service = DailyRecommendationService();

  final marine = MarineConditions(
    windSpeed: 12,
    windDirection: 'SW',

    swellHeight: 1.5,
    swellPeriod: 11,

    waterTemperature: 20,
    airTemperature: 23,
    atmosphericPressure: 1016,

    tide: 'Incoming',
    tideHeight: 1.8,
    tideState: 'Incoming',

    nextHighTide: null,
    nextLowTide: null,

    moonPhase: 'New',

    sunrise: DateTime.now(),
    sunset: DateTime.now(),
  );

  return service.generate(marine);
});