import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/fishing_spot_repository_impl.dart';
import '../../domain/entities/fishing_spot.dart';
import '../../domain/repositories/fishing_spot_repository.dart';

final fishingSpotRepositoryProvider =
Provider<FishingSpotRepository>(
      (ref) => FishingSpotRepositoryImpl(),
);

final fishingSpotsProvider =
FutureProvider<List<FishingSpot>>(
      (ref) {
    return ref.watch(
      fishingSpotRepositoryProvider,
    ).getAll();
  },
);
