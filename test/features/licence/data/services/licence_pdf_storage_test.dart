import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/licence/data/services/licence_pdf_storage.dart';
import 'package:project_neptune/features/licence/domain/licence_exceptions.dart';

// A real PDF magic header ("%PDF-1.4"), which is all isPdf()/store() check
// -- the rest of a real PDF's structure is irrelevant to this validation.
const _pdfBytes = [0x25, 0x50, 0x44, 0x46, 0x2D, 0x31, 0x2E, 0x34];
const _notPdfBytes = [1, 2, 3, 4, 5, 6, 7, 8];

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('licence_pdf_storage_test_');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  LicencePdfStorage storage() {
    return LicencePdfStorage(supportDirectory: () async => tempDir);
  }

  Future<File> writeFile(String name, List<int> bytes) async {
    final file = File('${tempDir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  group('LicencePdfStorage.isPdf', () {
    test('is true for a file starting with the PDF magic header', () async {
      final file = await writeFile('real.pdf', _pdfBytes);

      expect(await storage().isPdf(file), isTrue);
    });

    test('is false for a file that does not start with the PDF magic '
        'header, regardless of extension', () async {
      final file = await writeFile('fake.pdf', _notPdfBytes);

      expect(await storage().isPdf(file), isFalse);
    });

    test('is false for a file shorter than the magic header', () async {
      final file = await writeFile('short.pdf', [0x25, 0x50]);

      expect(await storage().isPdf(file), isFalse);
    });

    test('is false for a nonexistent file', () async {
      final file = File('${tempDir.path}/does-not-exist.pdf');

      expect(await storage().isPdf(file), isFalse);
    });
  });

  group('LicencePdfStorage.store', () {
    test('copies a valid PDF into the private support directory and '
        'returns the stored path', () async {
      final file = await writeFile('real.pdf', _pdfBytes);

      final storedPath = await storage().store(file);

      expect(storedPath, startsWith(tempDir.path));
      expect(await File(storedPath).exists(), isTrue);
      expect(await File(storedPath).readAsBytes(), _pdfBytes);
    });

    test('generates an internal filename rather than trusting the '
        'original filename', () async {
      final file = await writeFile('my-secret-licence-2026.pdf', _pdfBytes);

      final storedPath = await storage().store(file);

      expect(storedPath, isNot(contains('my-secret-licence-2026')));
    });

    test('two stores of two different files produce two different paths',
        () async {
      final first = await writeFile('first.pdf', _pdfBytes);
      final second = await writeFile('second.pdf', _pdfBytes);

      final firstPath = await storage().store(first);
      final secondPath = await storage().store(second);

      expect(firstPath, isNot(secondPath));
    });

    test('rejects a non-PDF file with InvalidPdfException', () async {
      final file = await writeFile('fake.pdf', _notPdfBytes);

      expect(
        () => storage().store(file),
        throwsA(isA<InvalidPdfException>()),
      );
    });

    test('a rejected non-PDF file is never copied into storage', () async {
      final file = await writeFile('fake.pdf', _notPdfBytes);

      try {
        await storage().store(file);
      } on InvalidPdfException {
        // expected
      }

      // Filter by filename rather than exact path equality, since
      // Directory.listSync()'s reconstructed paths aren't guaranteed to
      // be string-identical to the one this test built.
      final storedFiles = tempDir
          .listSync()
          .whereType<File>()
          .where((f) => !f.path.endsWith('fake.pdf'))
          .toList();

      expect(storedFiles, isEmpty);
    });
  });

  group('LicencePdfStorage.delete', () {
    test('removes an existing file', () async {
      final file = await writeFile('real.pdf', _pdfBytes);
      final storedPath = await storage().store(file);

      await storage().delete(storedPath);

      expect(await File(storedPath).exists(), isFalse);
    });

    test('does not throw when the file does not exist', () async {
      final missingPath = '${tempDir.path}/nonexistent.pdf';

      await expectLater(storage().delete(missingPath), completes);
    });
  });
}
