import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../marine/presentation/providers/marine_provider.dart';
import '../../../recommendation/services/best_species_selector.dart';
import '../../domain/entities/fishing_session.dart';

final fishingSessionProvider =
FutureProvider<FishingSession>((ref) async {
  final marineConditions =
  await ref.watch(marineConditionsProvider.future);

  final bestSpecies = const BestSpeciesSelector().selectBest(
    conditions: marineConditions,
  );

  return FishingSession(
    id: 'SESSION-001',
    location: 'Blue Lagoon',
    targetSpecies: bestSpecies.species,
    dateTime: DateTime.now(),
    marineConditions: marineConditions,
  );
});