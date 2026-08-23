import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:project_neptune/features/licence/data/repositories/licence_entitlement_repository_impl.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('LicenceEntitlementRepositoryImpl', () {
    test('hasConfirmedPremium is false before any confirmation', () async {
      final result =
          await LicenceEntitlementRepositoryImpl().hasConfirmedPremium();

      expect(result, isFalse);
    });

    test('confirmPremium persists true, readable by a new instance',
        () async {
      await LicenceEntitlementRepositoryImpl().confirmPremium();

      final result =
          await LicenceEntitlementRepositoryImpl().hasConfirmedPremium();

      expect(result, isTrue);
    });

    test('clearPremiumConfirmation resets the flag', () async {
      final repo = LicenceEntitlementRepositoryImpl();
      await repo.confirmPremium();

      await repo.clearPremiumConfirmation();

      expect(await repo.hasConfirmedPremium(), isFalse);
    });

    test('an invalid/missing entry never resolves as confirmed - a blank '
        'SharedPreferences store defaults to locked', () async {
      SharedPreferences.setMockInitialValues({});

      final result =
          await LicenceEntitlementRepositoryImpl().hasConfirmedPremium();

      expect(result, isFalse);
    });
  });
}
