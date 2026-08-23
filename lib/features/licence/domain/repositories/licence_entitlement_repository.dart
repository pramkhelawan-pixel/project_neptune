/// Local last-confirmed-Premium state for the Digital Fishing Licence
/// feature -- kept entirely separate from [LicenceRepository] (the
/// document itself) so Premium logic never has to live inside PDF
/// storage/file-handling code, and vice versa.
///
/// This cache exists solely so a previously-confirmed Premium user can
/// keep offline access to their own already-stored licence when a live
/// entitlement check is unavailable. It never grants access on its own to
/// a user who has never been confirmed Premium.
abstract class LicenceEntitlementRepository {
  const LicenceEntitlementRepository();

  /// Whether this device has ever seen `Profile.isPremium == true`.
  Future<bool> hasConfirmedPremium();

  /// Records that `Profile.isPremium == true` was just confirmed live.
  Future<void> confirmPremium();

  /// Clears the local confirmation (called when a live check resolves to
  /// a confirmed non-Premium account).
  Future<void> clearPremiumConfirmation();
}
