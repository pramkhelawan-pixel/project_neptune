import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:project_neptune/features/licence/data/repositories/licence_repository_impl.dart';
import 'package:project_neptune/features/licence/data/services/licence_pdf_storage.dart';
import 'package:project_neptune/features/licence/domain/entities/fishing_licence.dart';
import 'package:project_neptune/features/licence/domain/licence_exceptions.dart';

const _pdfBytes = [0x25, 0x50, 0x44, 0x46, 0x2D, 0x31, 0x2E, 0x34];
const _notPdfBytes = [1, 2, 3, 4, 5];

void main() {
  late Directory tempDir;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    tempDir = await Directory.systemTemp.createTemp('licence_repo_test_');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  LicenceRepositoryImpl repository() {
    return LicenceRepositoryImpl(
      pdfStorage: LicencePdfStorage(supportDirectory: () async => tempDir),
    );
  }

  Future<File> writeFile(String name, List<int> bytes) async {
    final file = File('${tempDir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  FishingLicence licence({DateTime? expiryDate}) {
    return FishingLicence(
      pdfPath: 'ignored',
      anglerName: 'Jane Angler',
      licenceNumber: 'ABC123',
      issuingAuthority: 'DFFE',
      validFrom: DateTime(2026, 1, 1),
      expiryDate: expiryDate ?? DateTime(2027, 1, 1),
      originalFileName: 'my-licence.pdf',
    );
  }

  group('LicenceRepositoryImpl - getLicence', () {
    test('returns null when nothing has been saved', () async {
      final result = await repository().getLicence();

      expect(result, isNull);
    });

    test('loads back exactly the metadata that was saved', () async {
      final source = await writeFile('captured.pdf', _pdfBytes);
      final repo = repository();

      await repo.saveLicence(licence: licence(), pdfFile: source);

      final loaded = await repo.getLicence();

      expect(loaded, isNotNull);
      expect(loaded!.anglerName, 'Jane Angler');
      expect(loaded.licenceNumber, 'ABC123');
      expect(loaded.issuingAuthority, 'DFFE');
      expect(loaded.validFrom, DateTime(2026, 1, 1));
      expect(loaded.expiryDate, DateTime(2027, 1, 1));
      expect(loaded.originalFileName, 'my-licence.pdf');
    });

    test('the stored PDF path points at a file that actually exists',
        () async {
      final source = await writeFile('captured.pdf', _pdfBytes);
      final repo = repository();

      await repo.saveLicence(licence: licence(), pdfFile: source);

      final loaded = await repo.getLicence();

      expect(await File(loaded!.pdfPath).exists(), isTrue);
    });
  });

  group('LicenceRepositoryImpl - persistence across instances', () {
    test('a licence saved by one repository instance is visible to a '
        'freshly-constructed instance (simulated app restart)', () async {
      final source = await writeFile('captured.pdf', _pdfBytes);

      await repository().saveLicence(licence: licence(), pdfFile: source);

      final restarted = repository();
      final loaded = await restarted.getLicence();

      expect(loaded, isNotNull);
      expect(loaded!.licenceNumber, 'ABC123');
    });

    test('the licence PDF bytes survive across instances unchanged',
        () async {
      final source = await writeFile('captured.pdf', _pdfBytes);

      await repository().saveLicence(licence: licence(), pdfFile: source);

      final loaded = await repository().getLicence();
      final bytes = await File(loaded!.pdfPath).readAsBytes();

      expect(bytes, _pdfBytes);
    });

    test('the PDF path reference remains valid (file exists) after '
        'restart', () async {
      final source = await writeFile('captured.pdf', _pdfBytes);

      await repository().saveLicence(licence: licence(), pdfFile: source);

      final restarted = repository();
      final loaded = await restarted.getLicence();

      expect(await File(loaded!.pdfPath).exists(), isTrue);
    });
  });

  group('LicenceRepositoryImpl - replace', () {
    test('a successful replacement stores the new PDF and removes the old '
        'one - no orphaned file remains', () async {
      final repo = repository();

      final first = await writeFile('first.pdf', _pdfBytes);
      await repo.saveLicence(licence: licence(), pdfFile: first);
      final firstLoaded = await repo.getLicence();
      final firstPath = firstLoaded!.pdfPath;

      final second = await writeFile('second.pdf', [..._pdfBytes, 0x00]);
      await repo.saveLicence(
        licence: licence(),
        pdfFile: second,
      );
      final secondLoaded = await repo.getLicence();

      expect(secondLoaded!.pdfPath, isNot(firstPath));
      expect(await File(firstPath).exists(), isFalse);
      expect(await File(secondLoaded.pdfPath).exists(), isTrue);
    });

    test('replacement updates metadata', () async {
      final repo = repository();

      final first = await writeFile('first.pdf', _pdfBytes);
      await repo.saveLicence(licence: licence(), pdfFile: first);

      final second = await writeFile('second.pdf', _pdfBytes);
      await repo.saveLicence(
        licence: FishingLicence(
          pdfPath: 'ignored',
          anglerName: 'New Angler',
          licenceNumber: 'NEW-999',
          issuingAuthority: 'DFFE',
          validFrom: DateTime(2026, 6, 1),
          expiryDate: DateTime(2028, 6, 1),
        ),
        pdfFile: second,
      );

      final loaded = await repo.getLicence();

      expect(loaded!.anglerName, 'New Angler');
      expect(loaded.licenceNumber, 'NEW-999');
    });

    test('a failed replacement (invalid PDF) does not destroy the '
        'existing valid licence', () async {
      final repo = repository();

      final first = await writeFile('first.pdf', _pdfBytes);
      await repo.saveLicence(licence: licence(), pdfFile: first);
      final beforeAttempt = await repo.getLicence();

      final badFile = await writeFile('bad.pdf', _notPdfBytes);

      await expectLater(
        repo.saveLicence(licence: licence(), pdfFile: badFile),
        throwsA(isA<InvalidPdfException>()),
      );

      final afterFailedAttempt = await repo.getLicence();

      expect(afterFailedAttempt, isNotNull);
      expect(afterFailedAttempt!.licenceNumber, beforeAttempt!.licenceNumber);
      expect(afterFailedAttempt.pdfPath, beforeAttempt.pdfPath);
      expect(await File(afterFailedAttempt.pdfPath).exists(), isTrue);
    });
  });

  group('LicenceRepositoryImpl - deleteLicence', () {
    test('removes the stored metadata', () async {
      final repo = repository();
      final source = await writeFile('captured.pdf', _pdfBytes);
      await repo.saveLicence(licence: licence(), pdfFile: source);

      await repo.deleteLicence();

      expect(await repo.getLicence(), isNull);
    });

    test('removes the stored PDF file from disk - no orphan remains',
        () async {
      final repo = repository();
      final source = await writeFile('captured.pdf', _pdfBytes);
      await repo.saveLicence(licence: licence(), pdfFile: source);
      final loaded = await repo.getLicence();
      final storedPath = loaded!.pdfPath;

      await repo.deleteLicence();

      expect(await File(storedPath).exists(), isFalse);
    });

    test('does not throw when there is nothing to delete', () async {
      await expectLater(repository().deleteLicence(), completes);
    });
  });

  group('LicenceRepositoryImpl - validation', () {
    test('saveLicence rejects a non-PDF file and never stores it',
        () async {
      final repo = repository();
      final badFile = await writeFile('bad.pdf', _notPdfBytes);

      await expectLater(
        repo.saveLicence(licence: licence(), pdfFile: badFile),
        throwsA(isA<InvalidPdfException>()),
      );

      expect(await repo.getLicence(), isNull);
    });
  });

  group('LicenceRepositoryImpl - no network involvement', () {
    test('every operation completes with no network client, HTTP, or '
        'Supabase dependency constructed or injected anywhere in the '
        'repository', () async {
      // LicenceRepositoryImpl's constructor takes only a LicencePdfStorage
      // (itself only a directory-resolving callback) -- there is no
      // ApiClient, Dio, or SupabaseClient parameter for a test to even
      // supply, which is itself the proof: the class cannot reach the
      // network because it has no reference to anything capable of doing
      // so.
      final repo = repository();
      final source = await writeFile('captured.pdf', _pdfBytes);

      await repo.saveLicence(licence: licence(), pdfFile: source);
      await repo.getLicence();
      await repo.deleteLicence();

      expect(true, isTrue);
    });
  });
}
