import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/catch_repository_impl.dart';
import '../../domain/entities/catch_record.dart';
import '../../domain/repositories/catch_repository.dart';
import '../../domain/services/catch_service.dart';

final catchRepositoryProvider =
Provider<CatchRepository>(
      (ref) => CatchRepositoryImpl(),
);

final catchServiceProvider =
Provider<CatchService>(
      (ref) => CatchService(
    repository: ref.watch(
      catchRepositoryProvider,
    ),
  ),
);

final catchHistoryProvider =
FutureProvider<List<CatchRecord>>(
      (ref) {
    return ref.watch(
      catchServiceProvider,
    ).getAllCatches();
  },
);