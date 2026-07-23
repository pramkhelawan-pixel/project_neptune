import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/marine_repository_impl.dart';
import '../../domain/models/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';

/// Repository provider.
///
/// The UI depends on the abstraction (MarineRepository),
/// while this provider supplies the concrete implementation.
final marineRepositoryProvider = Provider<MarineRepository>(
      (ref) => const MarineRepositoryImpl(),
);

/// Loads the latest marine conditions.
///
/// At the moment this returns mock data from the repository.
/// Later it will transparently switch to live APIs without
/// requiring changes in the UI.
final marineConditionsProvider =
FutureProvider<MarineConditions>((ref) async {
  final repository = ref.watch(marineRepositoryProvider);
  return repository.getMarineConditions();
});