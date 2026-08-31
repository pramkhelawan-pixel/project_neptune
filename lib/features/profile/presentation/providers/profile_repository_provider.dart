import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/auth/auth_state_provider.dart';
import '../../../../core/debug/debug_premium_allowlist.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';

final profileRepositoryProvider =
Provider<ProfileRepository>(
      (ref) => ProfileRepositoryImpl(),
);

/// Resolves the signed-in user's [Profile].
///
/// This is the single point both the Solunar Premium gate and the Digital
/// Fishing Licence Vault's entitlement layer (`licenceEntitlementProvider`)
/// read from, so applying [isDebugPremiumAllowlisted] here -- rather than
/// in either feature -- covers both without duplicating a Premium check.
/// See that function's documentation: it only ever changes anything in
/// debug builds, and only for its two fixed developer/test accounts.
final currentProfileProvider =
FutureProvider<Profile?>(
      (ref) async {
    final profile =
        await ref.watch(profileRepositoryProvider).getCurrentProfile();

    if (profile == null || profile.isPremium) {
      return profile;
    }

    // currentUserProvider reaches the real Supabase singleton. In
    // production Supabase is always initialised well before this runs, but
    // in a unit/widget test that fakes profileRepositoryProvider without
    // also overriding currentUserProvider, reading it throws (Supabase was
    // never initialised in that test). Treat that exactly like "no
    // signed-in user" -- never grant Premium, just fall through to the
    // profile's real, unmodified entitlement.
    String? email;
    try {
      email = ref.watch(currentUserProvider)?.email;
    } catch (_) {
      email = null;
    }

    if (!isDebugPremiumAllowlisted(email)) {
      return profile;
    }

    return Profile(
      id: profile.id,
      isPremium: true,
      createdAt: profile.createdAt,
    );
  },
);
