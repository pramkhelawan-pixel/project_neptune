import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/licence/domain/entities/fishing_licence.dart';
import 'package:project_neptune/features/licence/domain/licence_exceptions.dart';
import 'package:project_neptune/features/licence/domain/repositories/licence_repository.dart';
import 'package:project_neptune/features/licence/domain/services/pdf_picker.dart';
import 'package:project_neptune/features/licence/presentation/licence_copy.dart';
import 'package:project_neptune/features/licence/presentation/pages/licence_add_page.dart';
import 'package:project_neptune/features/licence/presentation/providers/licence_provider.dart';

class _FakePdfPicker implements PdfPicker {
  _FakePdfPicker(this._file);

  final File? _file;

  @override
  Future<File?> pickPdf() async => _file;
}

class _FakeLicenceRepository implements LicenceRepository {
  _FakeLicenceRepository({this.throwOnSave});

  final Exception? throwOnSave;
  FishingLicence? savedLicence;
  File? savedFile;
  var saveCallCount = 0;

  @override
  Future<void> saveLicence({
    required FishingLicence licence,
    required File pdfFile,
  }) async {
    saveCallCount++;

    if (throwOnSave != null) {
      throw throwOnSave!;
    }

    savedLicence = licence;
    savedFile = pdfFile;
  }

  @override
  Future<FishingLicence?> getLicence() => throw UnimplementedError();

  @override
  Future<void> deleteLicence() => throw UnimplementedError();
}

Widget harness({
  required File? pickedFile,
  required LicenceRepository repository,
}) {
  return ProviderScope(
    overrides: [
      pdfPickerProvider.overrideWithValue(_FakePdfPicker(pickedFile)),
      licenceRepositoryProvider.overrideWithValue(repository),
    ],
    child: const MaterialApp(home: LicenceAddPage()),
  );
}

Future<void> pickAnyDate(WidgetTester tester, String fieldLabel) async {
  // The disclaimer at the top of the page can push the date fields below
  // the test viewport, so scroll them into view before tapping.
  await tester.ensureVisible(find.text(fieldLabel));
  await tester.pumpAndSettle();
  await tester.tap(find.text(fieldLabel));
  await tester.pumpAndSettle();
  await tester.tap(find.text('OK'));
  await tester.pumpAndSettle();
}

Future<void> tapEnsuringVisible(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  await tester.tap(finder);
}

void main() {
  final fakeFile = File('/tmp/test-licence.pdf');

  group('LicenceAddPage - before selecting a PDF', () {
    testWidgets('shows only the Select PDF button, no form', (tester) async {
      await tester.pumpWidget(
        harness(pickedFile: null, repository: _FakeLicenceRepository()),
      );

      expect(find.text('Select PDF'), findsOneWidget);
      expect(find.text('Angler Name'), findsNothing);
      expect(find.text('Save Licence'), findsNothing);
    });

    testWidgets('shows the disclaimer even before a PDF is selected',
        (tester) async {
      await tester.pumpWidget(
        harness(pickedFile: null, repository: _FakeLicenceRepository()),
      );

      expect(find.text(kLicenceDisclaimer), findsOneWidget);
    });

    testWidgets('a cancelled picker (returns null) leaves the page in the '
        'initial state', (tester) async {
      await tester.pumpWidget(
        harness(pickedFile: null, repository: _FakeLicenceRepository()),
      );

      await tester.tap(find.text('Select PDF'));
      await tester.pump();

      expect(find.text('Select PDF'), findsOneWidget);
      expect(find.text('Angler Name'), findsNothing);
    });
  });

  group('LicenceAddPage - after selecting a PDF', () {
    testWidgets('shows the filename and the metadata form', (tester) async {
      await tester.pumpWidget(
        harness(pickedFile: fakeFile, repository: _FakeLicenceRepository()),
      );

      await tester.tap(find.text('Select PDF'));
      await tester.pump();

      expect(find.text('test-licence.pdf'), findsOneWidget);
      expect(find.text('Angler Name'), findsOneWidget);
      expect(find.text('Licence Number'), findsOneWidget);
      expect(find.text('Issuing Authority'), findsOneWidget);
      expect(find.text('Save Licence'), findsOneWidget);
    });

    testWidgets('attempting to save with empty required fields shows '
        'validation errors', (tester) async {
      await tester.pumpWidget(
        harness(pickedFile: fakeFile, repository: _FakeLicenceRepository()),
      );

      await tester.tap(find.text('Select PDF'));
      await tester.pump();

      await tapEnsuringVisible(tester, find.text('Save Licence'));
      await tester.pump();

      expect(find.text('Required'), findsWidgets);
    });

    testWidgets('a successful save calls the repository with the entered '
        'metadata and pops the page', (tester) async {
      final repository = _FakeLicenceRepository();

      await tester.pumpWidget(
        harness(pickedFile: fakeFile, repository: repository),
      );

      await tester.tap(find.text('Select PDF'));
      await tester.pump();

      await tester.enterText(
        find.byType(TextFormField).at(0),
        'Jane Angler',
      );
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'ABC123',
      );
      await tester.enterText(
        find.byType(TextFormField).at(2),
        'DFFE',
      );

      await pickAnyDate(tester, 'Valid From');
      await pickAnyDate(tester, 'Expiry Date');

      await tapEnsuringVisible(tester, find.text('Save Licence'));
      await tester.pumpAndSettle();

      expect(repository.saveCallCount, 1);
      expect(repository.savedLicence?.anglerName, 'Jane Angler');
      expect(repository.savedLicence?.licenceNumber, 'ABC123');
      expect(repository.savedLicence?.issuingAuthority, 'DFFE');
      expect(repository.savedFile?.path, fakeFile.path);
      // The page popped back to the (empty) Navigator root.
      expect(find.byType(LicenceAddPage), findsNothing);
    });

    testWidgets('a non-PDF file rejected by the repository shows an error '
        'and returns to file selection, without crashing', (tester) async {
      final repository = _FakeLicenceRepository(
        throwOnSave: const InvalidPdfException('not a real PDF'),
      );

      await tester.pumpWidget(
        harness(pickedFile: fakeFile, repository: repository),
      );

      await tester.tap(find.text('Select PDF'));
      await tester.pump();

      await tester.enterText(find.byType(TextFormField).at(0), 'Jane Angler');
      await tester.enterText(find.byType(TextFormField).at(1), 'ABC123');
      await tester.enterText(find.byType(TextFormField).at(2), 'DFFE');

      await pickAnyDate(tester, 'Valid From');
      await pickAnyDate(tester, 'Expiry Date');

      await tapEnsuringVisible(tester, find.text('Save Licence'));
      await tester.pumpAndSettle();

      expect(
        find.textContaining('not a valid PDF'),
        findsOneWidget,
      );
      // Back to file-selection state, not left in a broken/saved state.
      expect(find.text('Select PDF'), findsOneWidget);
    });
  });
}
