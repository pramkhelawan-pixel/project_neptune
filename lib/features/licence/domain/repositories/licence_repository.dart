import 'dart:io';

import '../entities/fishing_licence.dart';

/// Local persistence for the licence document itself (PDF file +
/// metadata). Deliberately excludes Premium/entitlement logic -- see
/// [LicenceEntitlementRepository] -- and must never depend on Supabase or
/// any other network client.
abstract class LicenceRepository {
  const LicenceRepository();

  /// The stored licence, or null if none has been saved yet.
  Future<FishingLicence?> getLicence();

  /// Saves [licence], copying [pdfFile] into local private storage under a
  /// freshly generated internal filename.
  ///
  /// Safe-replacement ordering: the new PDF is stored and the new metadata
  /// is written *before* any previous PDF file is deleted, so a failure
  /// partway through never leaves the user without their existing valid
  /// licence.
  Future<void> saveLicence({
    required FishingLicence licence,
    required File pdfFile,
  });

  /// Deletes the stored licence PDF and its metadata, if any.
  Future<void> deleteLicence();
}
