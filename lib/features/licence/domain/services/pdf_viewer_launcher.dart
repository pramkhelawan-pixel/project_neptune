/// Opens a locally-stored PDF with the device's own PDF viewer. The
/// original document is presented as-is -- implementations must never
/// download anything, make a network request, or reconstruct the
/// document from metadata.
abstract class PdfViewerLauncher {
  const PdfViewerLauncher();

  /// Opens the PDF at [path]. Throws [PdfOpenException] if it can't be
  /// opened (e.g. the file is missing or no viewer is available).
  Future<void> open(String path);
}

class PdfOpenException implements Exception {
  final String message;

  const PdfOpenException(this.message);

  @override
  String toString() => 'PdfOpenException: $message';
}
