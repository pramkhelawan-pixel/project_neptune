import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';

final profileRepositoryProvider =
Provider<ProfileRepository>(
      (ref) => ProfileRepositoryImpl(),
);

final currentProfileProvider =
FutureProvider<Profile?>(
      (ref) {
    return ref.watch(
      profileRepositoryProvider,
    ).getCurrentProfile();
  },
);
