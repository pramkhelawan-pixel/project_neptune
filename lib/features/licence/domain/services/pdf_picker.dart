import 'dart:io';

/// Lets the user select a PDF from the device. Implementations must never
/// perform any network operation -- selection is always local, even when
/// the underlying OS picker surfaces cloud-linked sources (the OS itself
/// resolves those to a local file before handing control back here).
abstract class PdfPicker {
  const PdfPicker();

  /// Returns the selected file, or null if the user cancelled.
  Future<File?> pickPdf();
}
