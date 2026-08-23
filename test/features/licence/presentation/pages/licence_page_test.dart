import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:project_neptune/features/licence/domain/entities/fishing_licence.dart';
import 'package:project_neptune/features/licence/domain/repositories/licence_repository.dart';
import 'package:project_neptune/features/licence/domain/services/pdf_viewer_launcher.dart';
import 'package:project_neptune/features/licence/presentation/licence_copy.dart';
import 'package:project_neptune/features/licence/presentation/pages/licence_page.dart';
import 'package:project_neptune/features/licence/presentation/providers/licence_provider.dart';
import 'package:project_neptune/features/profile/domain/entities/profile.dart';
import 'package:project_neptune/features/profile/domain/repositories/profile_repository.dart';
import 'package:project_neptune/features/profile/presentation/providers/profile_repository_provider.dart';

class _FakeProfileRepository implements ProfileRepository {
  _FakeProfileRepository(this._getCurrentProfile);

  final Future<Profile?> Function() _getCurrentProfile;

  @override
  Future<Profile?> getCurrentProfile() => _getCurrentProfile();

  @override
  Future<void> deleteAccount() => throw UnimplementedError();
}

class _FakeLicenceRepository implements LicenceRepository {
  bool deleteCalled = false;

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
    deleteCalled = true;
  }
}

class _FakePdfViewerLauncher implements PdfViewerLauncher {
  String? openedPath;
  final Object? errorToThrow;

  _FakePdfViewerLauncher({this.errorToThrow});

  @override
  Future<void> open(String path) async {
    openedPath = path;

    if (errorToThrow != null) {
      throw errorToThrow!;
    }
  }
}

FishingLicence _licence({required DateTime expiryDate}) {
  return FishingLicence(
    pdfPath: '/private/app-support/fishing_licence.pdf',
    anglerName: 'Jane Angler',
    licenceNumber: 'ABC123',
    issuingAuthority: 'DFFE',
    validFrom: DateTime(2026, 1, 1),
    expiryDate: expiryDate,
    originalFileName: 'my-licence.pdf',
  );
}

Widget harness({
  required bool isPremium,
  required FishingLicence? licence,
  LicenceRepository? licenceRepository,
  PdfViewerLauncher? pdfViewerLauncher,
}) {
  return ProviderScope(
    overrides: [
      profileRepositoryProvider.overrideWithValue(
        _FakeProfileRepository(
          () async => Profile(
            id: 'user-1',
            isPremium: isPremium,
            createdAt: DateTime(2026, 1, 1),
          ),
        ),
      ),
      if (licenceRepository != null)
        licenceRepositoryProvider.overrideWithValue(licenceRepository),
      if (pdfViewerLauncher != null)
        pdfViewerLauncherProvider.overrideWithValue(pdfViewerLauncher),
      storedLicenceProvider.overrideWith((ref) async => licence),
    ],
    child: const MaterialApp(home: LicencePage()),
  );
}

/// Settles the two chained FutureProviders (licenceEntitlementProvider,
/// then storedLicenceProvider). pumpAndSettle() is deliberately avoided --
/// it has proven unreliable with these Riverpod FutureProviders in this
/// test environment.
Future<void> pumpUntilResolved(WidgetTester tester) async {
  await tester.pump();
  await tester.pump();
}

void main() {
  setUp(() {
    // licenceEntitlementProvider falls through to the real
    // LicenceEntitlementRepositoryImpl (SharedPreferences-backed) unless
    // a test explicitly overrides it -- mock the backend so that never
    // hits a real, unhandled platform channel.
    SharedPreferences.setMockInitialValues({});
  });

  group('LicencePage - Free / locked', () {
    testWidgets('shows a Premium-required message, not the licence UI',
        (tester) async {
      await tester.pumpWidget(harness(isPremium: false, licence: null));
      await pumpUntilResolved(tester);

      expect(
        find.text('$kLicenceVaultName is a Premium feature.'),
        findsOneWidget,
      );
      expect(find.text('No fishing licence stored'), findsNothing);
      expect(find.text('Add Fishing Licence'), findsNothing);
    });

    testWidgets('uses the "Digital Fishing Licence Vault" feature name in '
        'the app bar, even while locked', (tester) async {
      await tester.pumpWidget(harness(isPremium: false, licence: null));
      await pumpUntilResolved(tester);

      expect(find.text(kLicenceVaultName), findsOneWidget);
    });
  });

  group('LicencePage - Premium, no licence stored', () {
    testWidgets('shows the empty state with an add button', (tester) async {
      await tester.pumpWidget(harness(isPremium: true, licence: null));
      await pumpUntilResolved(tester);

      expect(find.text('No fishing licence stored'), findsOneWidget);
      expect(find.text('Add Fishing Licence'), findsOneWidget);
    });
  });

  group('LicencePage - Premium, licence stored', () {
    testWidgets(
      'displays metadata, a "Document indicates: Valid" status, the Vault '
      'app bar title, and the disclaimer',
      (tester) async {
        final licence = _licence(
          expiryDate: DateTime.now().add(const Duration(days: 30)),
        );

        await tester.pumpWidget(harness(isPremium: true, licence: licence));
        await pumpUntilResolved(tester);

        expect(find.text(kLicenceVaultName), findsOneWidget);
        expect(find.text('Jane Angler'), findsOneWidget);
        expect(find.text('ABC123'), findsOneWidget);
        expect(find.text('DFFE'), findsOneWidget);
        // Deliberately not a bare "Valid" -- must never read as Neptune's
        // own verification of the licence.
        expect(find.text('Document indicates: Valid'), findsOneWidget);
        expect(find.text('Document indicates: Expired'), findsNothing);
        expect(find.text(kLicenceDisclaimer), findsOneWidget);
        expect(find.text('View Licence'), findsOneWidget);
        expect(find.text('Replace Licence'), findsOneWidget);
        expect(find.text('Delete Licence'), findsOneWidget);
      },
    );

    testWidgets(
      'an expired licence remains fully viewable, with a "Document '
      'indicates: Expired" status',
      (tester) async {
        final licence = _licence(expiryDate: DateTime(2020, 1, 1));

        await tester.pumpWidget(harness(isPremium: true, licence: licence));
        await pumpUntilResolved(tester);

        expect(find.text('Jane Angler'), findsOneWidget);
        expect(find.text('Document indicates: Expired'), findsOneWidget);
        expect(find.text('Document indicates: Valid'), findsNothing);
        // Still fully actionable, never hidden just because it expired.
        expect(find.text('View Licence'), findsOneWidget);
        expect(find.text('Replace Licence'), findsOneWidget);
        expect(find.text('Delete Licence'), findsOneWidget);
      },
    );

    testWidgets('View Licence opens the exact stored local PDF path, no '
        'network dependency involved', (tester) async {
      final licence = _licence(
        expiryDate: DateTime.now().add(const Duration(days: 30)),
      );
      final launcher = _FakePdfViewerLauncher();

      await tester.pumpWidget(
        harness(
          isPremium: true,
          licence: licence,
          pdfViewerLauncher: launcher,
        ),
      );
      await pumpUntilResolved(tester);

      await tester.tap(find.text('View Licence'));
      await tester.pump();

      expect(launcher.openedPath, licence.pdfPath);
    });

    testWidgets('a missing/corrupt local PDF is handled safely - shows a '
        'message instead of crashing', (tester) async {
      final licence = _licence(
        expiryDate: DateTime.now().add(const Duration(days: 30)),
      );
      final launcher = _FakePdfViewerLauncher(
        errorToThrow: const PdfOpenException('file not found'),
      );

      await tester.pumpWidget(
        harness(
          isPremium: true,
          licence: licence,
          pdfViewerLauncher: launcher,
        ),
      );
      await pumpUntilResolved(tester);

      await tester.tap(find.text('View Licence'));
      await tester.pump();

      expect(
        find.textContaining("Couldn't open the licence PDF"),
        findsOneWidget,
      );
    });

    testWidgets('Delete Licence invokes the repository delete operation',
        (tester) async {
      final licence = _licence(
        expiryDate: DateTime.now().add(const Duration(days: 30)),
      );
      final repository = _FakeLicenceRepository();

      await tester.pumpWidget(
        harness(
          isPremium: true,
          licence: licence,
          licenceRepository: repository,
        ),
      );
      await pumpUntilResolved(tester);

      // The disclaimer can push this button below the test viewport.
      await tester.ensureVisible(find.text('Delete Licence'));
      await tester.pump();
      await tester.tap(find.text('Delete Licence'));
      await tester.pump();
      await tester.tap(find.text('Delete'));
      await tester.pump();

      expect(repository.deleteCalled, isTrue);
    });
  });
}
