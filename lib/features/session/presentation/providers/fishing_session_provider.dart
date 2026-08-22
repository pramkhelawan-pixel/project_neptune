import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../location/domain/user_location_state.dart';
import '../../../location/presentation/providers/user_location_provider.dart';
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

  final locationState = await ref.watch(userLocationProvider.future);

  final locationLabel = switch (locationState) {
    UserLocationAvailable(:final latitude, :final longitude) =>
      '${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}',
    _ => 'Current Location',
  };

  return FishingSession(
    id: 'SESSION-001',
    location: locationLabel,
    targetSpecies: bestSpecies.species,
    dateTime: DateTime.now(),
    marineConditions: marineConditions,
  );
});