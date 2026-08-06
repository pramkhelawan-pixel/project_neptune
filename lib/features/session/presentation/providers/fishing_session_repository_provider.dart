import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/fishing_session_repository_impl.dart';
import '../../domain/repositories/fishing_session_repository.dart';

final fishingSessionRepositoryProvider =
Provider<FishingSessionRepository>(
      (ref) => FishingSessionRepositoryImpl(),
);
