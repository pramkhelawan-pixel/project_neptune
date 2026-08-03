import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/mappers/marine_conditions_legacy_mapper.dart';
import '../../data/repositories/marine_repository_impl.dart';

import '../../domain/models/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';
import '../../domain/value_objects/location_conditions.dart';

final marineRepositoryProvider = Provider<MarineRepository>(
      (ref) => MarineRepositoryImpl(),
);

final marineConditionsProvider =
FutureProvider<MarineConditions>((ref) async {
  final repository = ref.watch(marineRepositoryProvider);

  final entity = await repository.getCurrentConditions(
    location: const LocationConditions(
      country: 'South Africa',
      province: 'KwaZulu-Natal',
      region: 'Durban',
      beach: 'Durban',
      latitude: -29.8587,
      longitude: 31.0218,
    ),
  );

  return MarineConditionsLegacyMapper.toLegacy(entity);
});