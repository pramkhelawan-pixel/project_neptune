import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/calculators/data/length_weight_coefficients_table.dart';
import 'package:project_neptune/features/calculators/domain/entities/length_type.dart';

void main() {
  group('lengthWeightCoefficientsTable - V1 approved species only', () {
    test('contains exactly the three V1-approved species', () {
      final speciesIds =
          lengthWeightCoefficientsTable.map((c) => c.speciesId).toSet();

      expect(speciesIds, {'stumpnose', 'grunter', 'blacktail'});
    });

    test('does not contain species deferred pending stronger evidence '
        '(Shad, Kob, Garrick, White Steenbras, Bronze Bream)', () {
      final speciesIds =
          lengthWeightCoefficientsTable.map((c) => c.speciesId).toSet();

      expect(speciesIds, isNot(contains('shad')));
      expect(speciesIds, isNot(contains('kob')));
      expect(speciesIds, isNot(contains('garrick')));
      expect(speciesIds, isNot(contains('white_steenbras')));
      expect(speciesIds, isNot(contains('bronze_bream')));
    });

    test('every entry uses Standard Length, matching Harrison (2001)', () {
      for (final coefficients in lengthWeightCoefficientsTable) {
        expect(coefficients.lengthType, LengthType.standardLength);
      }
    });

    test('every entry cites the Harrison (2001) source', () {
      for (final coefficients in lengthWeightCoefficientsTable) {
        expect(coefficients.sourceCitation, contains('Harrison'));
        expect(coefficients.sourceCitation, contains('2001'));
        expect(
          coefficients.sourceCitation,
          contains('10.1046/j.1439-0426.2001.00277.x'),
        );
      }
    });

    test('Stumpnose coefficients match the approved Harrison (2001) values',
        () {
      final stumpnose = lengthWeightCoefficientsTable
          .firstWhere((c) => c.speciesId == 'stumpnose');

      expect(stumpnose.scientificName, 'Rhabdosargus holubi');
      expect(stumpnose.a, 0.0272);
      expect(stumpnose.b, 3.087);
      expect(stumpnose.minValidatedLengthCm, 1.1);
      expect(stumpnose.maxValidatedLengthCm, 24.0);
      expect(stumpnose.sampleSize, 1335);
      expect(stumpnose.rSquared, 0.993);
    });

    test('Grunter coefficients match the approved Harrison (2001) values',
        () {
      final grunter = lengthWeightCoefficientsTable
          .firstWhere((c) => c.speciesId == 'grunter');

      expect(grunter.scientificName, 'Pomadasys commersonnii');
      expect(grunter.a, 0.0209);
      expect(grunter.b, 3.001);
      expect(grunter.minValidatedLengthCm, 1.4);
      expect(grunter.maxValidatedLengthCm, 64.0);
      expect(grunter.sampleSize, 917);
      expect(grunter.rSquared, 0.997);
    });

    test('Blacktail coefficients match the approved Harrison (2001) values',
        () {
      final blacktail = lengthWeightCoefficientsTable
          .firstWhere((c) => c.speciesId == 'blacktail');

      expect(blacktail.scientificName, 'Diplodus capensis');
      expect(blacktail.a, 0.0276);
      expect(blacktail.b, 3.081);
      expect(blacktail.minValidatedLengthCm, 1.1);
      expect(blacktail.maxValidatedLengthCm, 22.0);
      expect(blacktail.sampleSize, 369);
      expect(blacktail.rSquared, 0.993);
    });
  });
}
