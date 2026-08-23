import 'package:open_filex/open_filex.dart';

import '../../domain/services/pdf_viewer_launcher.dart';

/// Opens a locally-stored PDF using the device's own PDF viewer, via
/// open_filex. Never downloads anything and never makes a network
/// request -- this only hands an already-local file path to the OS.
class OpenFilexPdfViewerLauncher implements PdfViewerLauncher {
  const OpenFilexPdfViewerLauncher();

  @override
  Future<void> open(String path) async {
    final result = await OpenFilex.open(path);

    if (result.type != ResultType.done) {
      throw PdfOpenException(result.message);
    }
  }
}
