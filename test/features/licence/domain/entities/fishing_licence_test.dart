import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/licence/domain/entities/fishing_licence.dart';

FishingLicence _licence({required DateTime expiryDate}) {
  return FishingLicence(
    pdfPath: '/tmp/licence.pdf',
    anglerName: 'Jane Angler',
    licenceNumber: 'ABC123',
    issuingAuthority: 'Department of Forestry, Fisheries and the Environment',
    validFrom: DateTime(2020, 1, 1),
    expiryDate: expiryDate,
  );
}

void main() {
  group('FishingLicence.isExpired', () {
    test('is false while the expiry date is still in the future', () {
      final licence = _licence(
        expiryDate: DateTime.now().add(const Duration(days: 30)),
      );

      expect(licence.isExpired, isFalse);
    });

    test('is false on the expiry date itself - still valid all day', () {
      final now = DateTime.now();
      final endOfToday = DateTime(now.year, now.month, now.day, 23, 59, 59);

      final licence = _licence(expiryDate: endOfToday);

      expect(licence.isExpired, isFalse);
    });

    test('is true the moment the expiry date has passed', () {
      final licence = _licence(
        expiryDate: DateTime.now().subtract(const Duration(seconds: 1)),
      );

      expect(licence.isExpired, isTrue);
    });

    test('is true for a clearly historical expiry date', () {
      final licence = _licence(expiryDate: DateTime(2020, 1, 1));

      expect(licence.isExpired, isTrue);
    });
  });
}
