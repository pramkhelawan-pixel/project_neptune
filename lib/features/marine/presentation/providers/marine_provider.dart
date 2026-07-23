import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/marine_repository_impl.dart';
import '../../domain/models/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';

/// Repository provider.
///
/// The UI depends on the abstraction (MarineRepository),
/// while this provider supplies the concrete implementation.
final marineRepositoryProvider = Provider<MarineRepository>(
      (ref) => MarineRepositoryImpl(),
);

/// Loads the latest marine conditions.
///
/// The repository retrieves marine conditions from the configured
/// remote data source. The UI remains unaware of where the data
/// originates.
final marineConditionsProvider =
FutureProvider<MarineConditions>((ref) async {
  final repository = ref.watch(marineRepositoryProvider);
  return repository.getMarineConditions();
});