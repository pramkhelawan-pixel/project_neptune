import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../marine/presentation/providers/marine_provider.dart';
import '../../domain/entities/fishing_session.dart';

final fishingSessionProvider =
FutureProvider<FishingSession>((ref) async {
  final marineConditions =
  await ref.watch(marineConditionsProvider.future);

  return FishingSession(
    id: 'SESSION-001',
    location: 'Blue Lagoon',
    targetSpecies: 'Shad',
    dateTime: DateTime.now(),
    marineConditions: marineConditions,
  );
});