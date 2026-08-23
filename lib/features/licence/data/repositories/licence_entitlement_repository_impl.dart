import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/licence_entitlement_repository.dart';

/// Local-only implementation of [LicenceEntitlementRepository]. Stores a
/// single boolean flag in its own [SharedPreferences] key, entirely
/// separate from the licence document's own metadata key -- deleting the
/// licence never touches this, and clearing this flag never touches the
/// stored PDF/metadata.
class LicenceEntitlementRepositoryImpl implements LicenceEntitlementRepository {
  static const _premiumConfirmedKey = 'licence_premium_confirmed_v1';

  @override
  Future<bool> hasConfirmedPremium() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_premiumConfirmedKey) ?? false;
  }

  @override
  Future<void> confirmPremium() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_premiumConfirmedKey, true);
  }

  @override
  Future<void> clearPremiumConfirmation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_premiumConfirmedKey);
  }
}
