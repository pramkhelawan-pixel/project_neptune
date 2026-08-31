import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:project_neptune/core/auth/auth_state_provider.dart';
import 'package:project_neptune/features/profile/domain/entities/profile.dart';
import 'package:project_neptune/features/profile/domain/repositories/profile_repository.dart';
import 'package:project_neptune/features/profile/presentation/providers/profile_repository_provider.dart';

/// This suite exercises `currentProfileProvider` -- the single shared
/// entitlement boundary both the Solunar Premium gate and
/// `licenceEntitlementProvider` (Digital Fishing Licence Vault) read
/// from -- entirely against fakes. No real Supabase client is
/// constructed anywhere here, proving the debug allowlist introduces no
/// network/API call of its own.
///
/// Release/profile-build behaviour (requirement: "the debug allowlist
/// cannot grant Premium outside debug builds") is proven at the
/// `isDebugPremiumAllowlisted` unit-test level
/// (test/core/debug/debug_premium_allowlist_test.dart), because
/// `kDebugMode` is a compile-time constant that cannot be toggled at
/// runtime within a single `flutter test` process. This provider always
/// delegates to that already-proven function using its real default.
class _FakeProfileRepository implements ProfileRepository {
  _FakeProfileRepository(this._profile);

  final Profile? _profile;

  @override
  Future<Profile?> getCurrentProfile() async => _profile;

  @override
  Future<void> deleteAccount() => throw UnimplementedError();
}

User _user({required String email}) => User(
      id: 'auth-user-1',
      appMetadata: const {},
      userMetadata: const {},
      aud: 'authenticated',
      createdAt: '2026-01-01T00:00:00Z',
      email: email,
    );

Profile _profile({required bool isPremium}) => Profile(
      id: 'user-1',
      isPremium: isPremium,
      createdAt: DateTime(2026, 1, 1),
    );

ProviderContainer _containerFor({
  required Profile? profile,
  User? user,
}) {
  final container = ProviderContainer(
    overrides: [
      profileRepositoryProvider.overrideWithValue(
        _FakeProfileRepository(profile),
      ),
      currentUserProvider.overrideWithValue(user),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('currentProfileProvider - debug Premium allowlist', () {
    test(
      'an allowlisted email on a non-Premium profile resolves as Premium',
      () async {
        final container = _containerFor(
          profile: _profile(isPremium: false),
          user: _user(email: 'p.ramkhelawan@gmail.com'),
        );

        final result = await container.read(currentProfileProvider.future);

        expect(result?.isPremium, isTrue);
      },
    );

    test(
      'the second allowlisted email on a non-Premium profile resolves as '
      'Premium',
      () async {
        final container = _containerFor(
          profile: _profile(isPremium: false),
          user: _user(email: 'ramkhelawan.nitasha@gmail.com'),
        );

        final result = await container.read(currentProfileProvider.future);

        expect(result?.isPremium, isTrue);
      },
    );

    test(
      'a different, non-allowlisted email on a non-Premium profile stays '
      'non-Premium -- normal entitlement behaviour is unaffected',
      () async {
        final container = _containerFor(
          profile: _profile(isPremium: false),
          user: _user(email: 'someone.else@example.com'),
        );

        final result = await container.read(currentProfileProvider.future);

        expect(result?.isPremium, isFalse);
      },
    );

    test(
      'no signed-in user (unauthenticated) never becomes Premium via the '
      'allowlist, even if the profile happened to resolve',
      () async {
        final container = _containerFor(
          profile: _profile(isPremium: false),
          user: null,
        );

        final result = await container.read(currentProfileProvider.future);

        expect(result?.isPremium, isFalse);
      },
    );

    test(
      'a null profile (no row / unauthenticated) is never converted into '
      'a fabricated Premium profile, even for an allowlisted email',
      () async {
        final container = _containerFor(
          profile: null,
          user: _user(email: 'p.ramkhelawan@gmail.com'),
        );

        final result = await container.read(currentProfileProvider.future);

        expect(result, isNull);
      },
    );

    test(
      'an already-Premium profile for an allowlisted email is returned '
      'unchanged -- existing genuine Premium entitlement still works',
      () async {
        final container = _containerFor(
          profile: _profile(isPremium: true),
          user: _user(email: 'p.ramkhelawan@gmail.com'),
        );

        final result = await container.read(currentProfileProvider.future);

        expect(result?.isPremium, isTrue);
      },
    );

    test(
      'an already-Premium profile for a non-allowlisted email is '
      'unaffected -- existing genuine Premium entitlement still works',
      () async {
        final container = _containerFor(
          profile: _profile(isPremium: true),
          user: _user(email: 'someone.else@example.com'),
        );

        final result = await container.read(currentProfileProvider.future);

        expect(result?.isPremium, isTrue);
      },
    );

    test(
      'an explicitly non-Premium profile for an unrelated user is not '
      'accidentally converted',
      () async {
        final container = _containerFor(
          profile: _profile(isPremium: false),
          user: _user(email: 'not.an.allowlisted.account@example.com'),
        );

        final result = await container.read(currentProfileProvider.future);

        expect(result?.isPremium, isFalse);
      },
    );
  });
}
