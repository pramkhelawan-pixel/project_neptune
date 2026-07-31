import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../marine/presentation/providers/marine_provider.dart';

import '../../domain/entities/daily_species_recommendation.dart';
import '../../domain/services/daily_recommendation_service.dart';

/// Produces Neptune's daily species recommendations from the
/// live marine conditions provider.
final dailyRecommendationProvider =
FutureProvider<DailySpeciesRecommendation>((ref) async {
  final marine =
  await ref.watch(marineConditionsProvider.future);

  const service = DailyRecommendationService();

  return service.generate(marine);
});