import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:project_neptune/features/authentication/data/auth_repository.dart';
import 'package:project_neptune/features/authentication/presentation/providers/auth_controller.dart';
import 'package:project_neptune/features/licence/domain/entities/fishing_licence.dart';
import 'package:project_neptune/features/licence/domain/repositories/licence_entitlement_repository.dart';
import 'package:project_neptune/features/licence/domain/repositories/licence_repository.dart';
import 'package:project_neptune/features/licence/presentation/providers/licence_provider.dart';
import 'package:project_neptune/features/profile/domain/entities/profile.dart';
import 'package:project_neptune/features/profile/domain/repositories/profile_repository.dart';
import 'package:project_neptune/features/profile/presentation/pages/profile_page.dart';
import 'package:project_neptune/features/profile/presentation/providers/profile_repository_provider.dart';

/// [ProfilePage] reads `SupabaseService.client.auth.currentUser` directly
/// (not through a provider), so a real -- but fake-URL -- Supabase instance
/// must exist or that read throws. `Supabase.initialize` sets
/// `_isInitialized` synchronously and only *starts* (does not await)
/// session recovery; with SharedPreferences mocked empty (see setUpAll
/// below), there is no persisted session to recover, so no network call is
/// ever attempted. Must run exactly once per test process.
Future<void> _initSupabaseForTest() async {
  await Supabase.initialize(
    url: 'https://test.supabase.co',
    publishableKey: 'test-anon-key',
  );
}

class _FakeProfileRepository implements ProfileRepository {
  _FakeProfileRepository({required this.callLog});

  final List<String> callLog;

  @override
  Future<Profile?> getCurrentProfile() async => Profile(
        id: 'user-1',
        isPremium: true,
        createdAt: DateTime(2026, 1, 1),
      );

  @override
  Future<void> deleteAccount() async {
    callLog.add('deleteAccount');
  }
}

class _FakeLicenceRepository implements LicenceRepository {
  _FakeLicenceRepository({required this.callLog, this.deleteLicenceError});

  final List<String> callLog;
  final Object? deleteLicenceError;

  @override
  Future<FishingLicence?> getLicence() => throw UnimplementedError();

  @override
  Future<void> saveLicence({
    required FishingLicence licence,
    required File pdfFile,
  }) =>
      throw UnimplementedError();

  @override
  Future<void> deleteLicence() async {
    callLog.add('deleteLicence');
    if (deleteLicenceError != null) {
      throw deleteLicenceError!;
    }
  }
}

class _FakeLicenceEntitlementRepository implements LicenceEntitlementRepository {
  _FakeLicenceEntitlementRepository({required this.callLog});

  final List<String> callLog;

  @override
  Future<bool> hasConfirmedPremium() async => true;

  @override
  Future<void> confirmPremium() async {
    // Called incidentally by licenceEntitlementProvider's own resolution
    // when the (fake) profile is Premium -- deliberately not logged, so
    // callLog only reflects the account-deletion flow itself.
  }

  @override
  Future<void> clearPremiumConfirmation() async {
    callLog.add('clearPremiumConfirmation');
  }
}

class MockAuthRepository extends Mock implements AuthRepository {}

Widget harness({
  required List<String> callLog,
  required ProfileRepository profileRepository,
  required LicenceRepository licenceRepository,
  required LicenceEntitlementRepository licenceEntitlementRepository,
  required AuthRepository authRepository,
}) {
  return ProviderScope(
    overrides: [
      profileRepositoryProvider.overrideWithValue(profileRepository),
      licenceRepositoryProvider.overrideWithValue(licenceRepository),
      licenceEntitlementRepositoryProvider
          .overrideWithValue(licenceEntitlementRepository),
      authRepositoryProvider.overrideWithValue(authRepository),
    ],
    child: const MaterialApp(home: ProfilePage()),
  );
}

/// Settles the chained FutureProviders (currentProfileProvider, then
/// licenceEntitlementProvider) -- pumpAndSettle() is deliberately avoided
/// throughout this suite; see licence_page_test.dart for the same note.
Future<void> pumpUntilResolved(WidgetTester tester) async {
  await tester.pump();
  await tester.pump();
}

Future<void> openDeleteDialogAndConfirm(WidgetTester tester) async {
  await tester.ensureVisible(find.text('Delete Account'));
  await tester.pump();
  await tester.tap(find.text('Delete Account'));
  await tester.pump();

  await tester.tap(find.text('Delete My Account'));
  // Drains: deleteAccount() -> (local cleanup) -> signOut() -> pop().
  await tester.pump();
  await tester.pump();
  await tester.pump();
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(Exception('fallback'));
    // Supabase.initialize() constructs a SharedPreferences-backed local
    // storage internally, so the mock plugin values must exist before it
    // runs, not just before each individual test.
    SharedPreferences.setMockInitialValues({});
    await _initSupabaseForTest();
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('ProfilePage - Delete Account', () {
    testWidgets(
      'on successful server-side deletion, clears local Licence Vault data '
      '(in order, after deletion) and still signs out',
      (tester) async {
        final callLog = <String>[];
        final licenceRepository = _FakeLicenceRepository(callLog: callLog);
        final entitlementRepository =
            _FakeLicenceEntitlementRepository(callLog: callLog);
        final authRepository = MockAuthRepository();
        when(() => authRepository.signOut()).thenAnswer((_) async {
          callLog.add('signOut');
        });

        await tester.pumpWidget(
          harness(
            callLog: callLog,
            profileRepository: _FakeProfileRepository(callLog: callLog),
            licenceRepository: licenceRepository,
            licenceEntitlementRepository: entitlementRepository,
            authRepository: authRepository,
          ),
        );
        await pumpUntilResolved(tester);

        await openDeleteDialogAndConfirm(tester);

        expect(
          callLog,
          ['deleteAccount', 'deleteLicence', 'clearPremiumConfirmation', 'signOut'],
        );
        verify(() => authRepository.signOut()).called(1);
      },
    );

    testWidgets(
      'when local Licence Vault cleanup throws, the server-side deletion is '
      'still treated as successful (no error shown, dialog closes) and '
      'signOut() still occurs',
      (tester) async {
        final callLog = <String>[];
        final licenceRepository = _FakeLicenceRepository(
          callLog: callLog,
          deleteLicenceError: Exception('local cleanup failed'),
        );
        final entitlementRepository =
            _FakeLicenceEntitlementRepository(callLog: callLog);
        final authRepository = MockAuthRepository();
        when(() => authRepository.signOut()).thenAnswer((_) async {
          callLog.add('signOut');
        });

        await tester.pumpWidget(
          harness(
            callLog: callLog,
            profileRepository: _FakeProfileRepository(callLog: callLog),
            licenceRepository: licenceRepository,
            licenceEntitlementRepository: entitlementRepository,
            authRepository: authRepository,
          ),
        );
        await pumpUntilResolved(tester);

        await openDeleteDialogAndConfirm(tester);

        // deleteLicence() threw before ever reaching clearPremiumConfirmation()
        // or appending to callLog itself, but signOut() must still have run,
        // and no account-deletion error must be visible.
        expect(callLog, contains('deleteAccount'));
        expect(callLog, contains('signOut'));
        verify(() => authRepository.signOut()).called(1);

        expect(find.byType(AlertDialog), findsNothing);
        expect(find.textContaining('Failed to delete'), findsNothing);
        expect(find.textContaining('local cleanup failed'), findsNothing);
      },
    );
  });
}
