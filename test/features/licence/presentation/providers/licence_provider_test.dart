import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/licence/domain/repositories/licence_entitlement_repository.dart';
import 'package:project_neptune/features/licence/presentation/providers/licence_provider.dart';
import 'package:project_neptune/features/profile/domain/entities/profile.dart';
import 'package:project_neptune/features/profile/domain/repositories/profile_repository.dart';
import 'package:project_neptune/features/profile/presentation/providers/profile_repository_provider.dart';

/// In-memory fake covering only what the entitlement provider needs --
/// storage-detail tests live in licence_entitlement_repository_impl_test.dart.
class _FakeLicenceEntitlementRepository implements LicenceEntitlementRepository {
  bool _confirmed = false;

  @override
  Future<bool> hasConfirmedPremium() async => _confirmed;

  @override
  Future<void> confirmPremium() async => _confirmed = true;

  @override
  Future<void> clearPremiumConfirmation() async => _confirmed = false;
}

class _FakeProfileRepository implements ProfileRepository {
  _FakeProfileRepository(this._getCurrentProfile);

  final Future<Profile?> Function() _getCurrentProfile;

  @override
  Future<Profile?> getCurrentProfile() => _getCurrentProfile();

  @override
  Future<void> deleteAccount() => throw UnimplementedError();
}

Profile _profile({required bool isPremium}) => Profile(
      id: 'user-1',
      isPremium: isPremium,
      createdAt: DateTime(2026, 1, 1),
    );

void main() {
  late _FakeLicenceEntitlementRepository entitlementRepository;

  setUp(() {
    entitlementRepository = _FakeLicenceEntitlementRepository();
  });

  ProviderContainer containerFor(
    Future<Profile?> Function() profileLookup,
  ) {
    final container = ProviderContainer(
      overrides: [
        profileRepositoryProvider.overrideWithValue(
          _FakeProfileRepository(profileLookup),
        ),
        licenceEntitlementRepositoryProvider.overrideWithValue(
          entitlementRepository,
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('licenceEntitlementProvider - live confirmation', () {
    test('a confirmed Premium user unlocks the feature', () async {
      final container = containerFor(
        () async => _profile(isPremium: true),
      );

      final result = await container.read(
        licenceEntitlementProvider.future,
      );

      expect(result, isTrue);
    });

    test('a confirmed free user is locked', () async {
      final container = containerFor(
        () async => _profile(isPremium: false),
      );

      final result = await container.read(
        licenceEntitlementProvider.future,
      );

      expect(result, isFalse);
    });

    test('a null profile (no row yet) is locked', () async {
      final container = containerFor(() async => null);

      final result = await container.read(
        licenceEntitlementProvider.future,
      );

      expect(result, isFalse);
    });
  });

  group('licenceEntitlementProvider - local confirmation cache', () {
    test('a live Premium confirmation persists the local cache flag',
        () async {
      final container = containerFor(
        () async => _profile(isPremium: true),
      );

      await container.read(licenceEntitlementProvider.future);

      expect(await entitlementRepository.hasConfirmedPremium(), isTrue);
    });

    test('a live confirmed-free result clears any previous cache flag',
        () async {
      await entitlementRepository.confirmPremium();

      final container = containerFor(
        () async => _profile(isPremium: false),
      );

      await container.read(licenceEntitlementProvider.future);

      expect(await entitlementRepository.hasConfirmedPremium(), isFalse);
    });

    test(
      'a previously-confirmed Premium user keeps access when the profile '
      'request subsequently fails (e.g. Supabase unavailable)',
      () async {
        await entitlementRepository.confirmPremium();

        final container = containerFor(
          () async => throw Exception('network unavailable'),
        );

        final result = await container.read(
          licenceEntitlementProvider.future,
        );

        expect(result, isTrue);
      },
    );

    test(
      'a user who was never confirmed Premium stays locked when the '
      'profile request fails - nothing to fall back on',
      () async {
        final container = containerFor(
          () async => throw Exception('network unavailable'),
        );

        final result = await container.read(
          licenceEntitlementProvider.future,
        );

        expect(result, isFalse);
      },
    );

    test(
      'an invalid/missing local entitlement state never unlocks the '
      'feature on its own - the repository default (false) is honoured',
      () async {
        // entitlementRepository starts unconfirmed (_confirmed = false) by
        // construction, modelling a missing/never-written local flag.
        final container = containerFor(
          () async => throw Exception('network unavailable'),
        );

        final result = await container.read(
          licenceEntitlementProvider.future,
        );

        expect(result, isFalse);
      },
    );
  });

  group('licenceEntitlementProvider - does not affect Solunar', () {
    test(
      'the licence entitlement cache is a separate provider/repository '
      'from currentProfileProvider - resolving it never mutates the '
      'profile itself, so Solunar (which reads currentProfileProvider '
      'directly) is unaffected',
      () async {
        var profileCallCount = 0;

        final container = containerFor(() async {
          profileCallCount++;
          return _profile(isPremium: true);
        });

        await container.read(licenceEntitlementProvider.future);
        final profileAfterLicenceCheck = await container.read(
          currentProfileProvider.future,
        );

        expect(profileAfterLicenceCheck?.isPremium, isTrue);
        expect(profileCallCount, greaterThan(0));
      },
    );
  });
}
