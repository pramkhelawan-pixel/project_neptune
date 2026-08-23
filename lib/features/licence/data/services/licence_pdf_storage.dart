import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../domain/licence_exceptions.dart';

/// Pure local file operations for the licence PDF. Contains no metadata
/// persistence and no Premium/entitlement logic -- see
/// [LicenceRepository]/[LicenceEntitlementRepository] for those.
class LicencePdfStorage {
  LicencePdfStorage({
    Future<Directory> Function()? supportDirectory,
    Uuid? uuid,
  })  : _supportDirectory = supportDirectory ?? getApplicationSupportDirectory,
        _uuid = uuid ?? const Uuid();

  static const _pdfHeader = [0x25, 0x50, 0x44, 0x46, 0x2D]; // "%PDF-"

  final Future<Directory> Function() _supportDirectory;
  final Uuid _uuid;

  /// Whether [file]'s content actually starts with the standard PDF
  /// header, regardless of its extension or original filename.
  Future<bool> isPdf(File file) async {
    if (!await file.exists()) {
      return false;
    }

    final length = await file.length();

    if (length < _pdfHeader.length) {
      return false;
    }

    final bytes = await file.openRead(0, _pdfHeader.length).first;

    for (var i = 0; i < _pdfHeader.length; i++) {
      if (bytes[i] != _pdfHeader[i]) {
        return false;
      }
    }

    return true;
  }

  /// Validates [sourceFile] is a real PDF, then copies it into the app's
  /// private application-support directory under a freshly generated
  /// internal filename (never the original filename). Returns the final
  /// stored path.
  Future<String> store(File sourceFile) async {
    if (!await isPdf(sourceFile)) {
      throw const InvalidPdfException(
        'The selected file is not a valid PDF.',
      );
    }

    final directory = await _supportDirectory();
    final storedPath = '${directory.path}/${_uuid.v4()}.pdf';

    await sourceFile.copy(storedPath);

    return storedPath;
  }

  /// Deletes the PDF at [path], if it exists. Never throws for a
  /// already-missing file.
  Future<void> delete(String path) async {
    final file = File(path);

    if (await file.exists()) {
      await file.delete();
    }
  }
}
