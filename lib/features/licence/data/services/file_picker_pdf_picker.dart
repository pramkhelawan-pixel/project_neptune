import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../../domain/services/pdf_picker.dart';

/// Selects a PDF via the OS's native document picker. Purely local --
/// selection never involves a network call from this app's own code (the
/// OS resolves any cloud-linked source to a local file before handing
/// control back here).
class FilePickerPdfPicker implements PdfPicker {
  const FilePickerPdfPicker();

  @override
  Future<File?> pickPdf() async {
    final picked = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    final path = picked?.path;

    if (path == null) {
      return null;
    }

    return File(path);
  }
}
