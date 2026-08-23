/// A locally-stored fishing licence: a reference to the angler's official
/// PDF document plus the metadata an official would check.
class FishingLicence {
  /// Path to the stored PDF on local (private, app-sandboxed) storage.
  final String pdfPath;

  final String anglerName;
  final String licenceNumber;
  final String issuingAuthority;
  final DateTime validFrom;
  final DateTime expiryDate;

  /// The original filename the user selected, kept only for display (e.g.
  /// "Show original name" in the UI) -- never used to derive the stored
  /// path, which is always an internally-generated name.
  final String? originalFileName;

  const FishingLicence({
    required this.pdfPath,
    required this.anglerName,
    required this.licenceNumber,
    required this.issuingAuthority,
    required this.validFrom,
    required this.expiryDate,
    this.originalFileName,
  });

  /// True once the current moment is past [expiryDate] -- the licence is
  /// still considered valid for the entirety of its expiry date itself.
  bool get isExpired => DateTime.now().isAfter(expiryDate);
}
