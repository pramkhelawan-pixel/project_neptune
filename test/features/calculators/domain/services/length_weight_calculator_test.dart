import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/calculators/domain/entities/length_type.dart';
import 'package:project_neptune/features/calculators/domain/entities/length_unit.dart';
import 'package:project_neptune/features/calculators/domain/entities/length_weight_coefficients.dart';
import 'package:project_neptune/features/calculators/domain/entities/length_weight_estimate.dart';
import 'package:project_neptune/features/calculators/domain/services/length_weight_calculator.dart';

/// Exact real coefficients (Harrison 2001, Table 1) -- not synthetic test
/// fixtures -- so these tests double as a regression guard on the
/// production dataset in length_weight_coefficients_table.dart.
const _stumpnose = LengthWeightCoefficients(
  speciesId: 'stumpnose',
  scientificName: 'Rhabdosargus holubi',
  displayName: 'Stumpnose',
  a: 0.0272,
  b: 3.087,
  lengthType: LengthType.standardLength,
  lengthUnit: 'cm',
  weightUnit: 'g',
  minValidatedLengthCm: 1.1,
  maxValidatedLengthCm: 24.0,
  sampleSize: 1335,
  rSquared: 0.993,
  sourceCitation: 'Harrison (2001)',
);

const _grunter = LengthWeightCoefficients(
  speciesId: 'grunter',
  scientificName: 'Pomadasys commersonnii',
  displayName: 'Grunter',
  a: 0.0209,
  b: 3.001,
  lengthType: LengthType.standardLength,
  lengthUnit: 'cm',
  weightUnit: 'g',
  minValidatedLengthCm: 1.4,
  maxValidatedLengthCm: 64.0,
  sampleSize: 917,
  rSquared: 0.997,
  sourceCitation: 'Harrison (2001)',
);

const _blacktail = LengthWeightCoefficients(
  speciesId: 'blacktail',
  scientificName: 'Diplodus capensis',
  displayName: 'Blacktail',
  a: 0.0276,
  b: 3.081,
  lengthType: LengthType.standardLength,
  lengthUnit: 'cm',
  weightUnit: 'g',
  minValidatedLengthCm: 1.1,
  maxValidatedLengthCm: 22.0,
  sampleSize: 369,
  rSquared: 0.993,
  sourceCitation: 'Harrison (2001)',
);

void main() {
  const calculator = LengthWeightCalculator();

  group('LengthWeightCalculator - valid calculation, cm input', () {
    test('Stumpnose at 15cm matches the known W = a*L^b value', () {
      final result = calculator.calculate(
        coefficients: _stumpnose,
        length: 15,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.success);
      expect(result.estimatedWeightGrams, closeTo(116.18835975, 1e-5));
      expect(result.estimatedWeightKg, closeTo(0.11618836, 1e-8));
    });

    test('Grunter at 10cm matches the known W = a*L^b value', () {
      final result = calculator.calculate(
        coefficients: _grunter,
        length: 10,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.success);
      expect(result.estimatedWeightGrams, closeTo(20.94817948, 1e-5));
    });

    test('Blacktail at 15cm matches the known W = a*L^b value', () {
      final result = calculator.calculate(
        coefficients: _blacktail,
        length: 15,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.success);
      expect(result.estimatedWeightGrams, closeTo(115.99686482, 1e-5));
    });
  });

  group('LengthWeightCalculator - inch input and unit conversion', () {
    test('converts inches to centimetres before applying the equation', () {
      final cmResult = calculator.calculate(
        coefficients: _stumpnose,
        length: 15,
        unit: LengthUnit.centimetres,
      );

      final inchResult = calculator.calculate(
        coefficients: _stumpnose,
        length: 15 / 2.54,
        unit: LengthUnit.inches,
      );

      expect(inchResult.lengthCm, closeTo(15.0, 1e-9));
      expect(
        inchResult.estimatedWeightGrams,
        closeTo(cmResult.estimatedWeightGrams!, 1e-6),
      );
    });

    test('10 inches normalises to 25.4cm', () {
      final result = calculator.calculate(
        coefficients: _grunter,
        length: 10,
        unit: LengthUnit.inches,
      );

      expect(result.lengthCm, closeTo(25.4, 1e-9));
      expect(result.outcome, LengthWeightEstimateOutcome.success);
    });
  });

  group('LengthWeightCalculator - invalid input', () {
    test('zero length is rejected without a weight', () {
      final result = calculator.calculate(
        coefficients: _stumpnose,
        length: 0,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.invalidLength);
      expect(result.estimatedWeightGrams, isNull);
    });

    test('negative length is rejected without a weight', () {
      final result = calculator.calculate(
        coefficients: _stumpnose,
        length: -5,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.invalidLength);
      expect(result.estimatedWeightGrams, isNull);
    });
  });

  group('LengthWeightCalculator - range validation', () {
    test('a length below the validated minimum is rejected, not '
        'extrapolated', () {
      final result = calculator.calculate(
        coefficients: _stumpnose,
        length: 0.5,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.belowValidatedRange);
      expect(result.estimatedWeightGrams, isNull);
    });

    test('a length above the validated maximum is rejected, not '
        'extrapolated', () {
      final result = calculator.calculate(
        coefficients: _blacktail,
        length: 50,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.aboveValidatedRange);
      expect(result.estimatedWeightGrams, isNull);
    });

    test('White Steenbras-style extrapolation scenario: a length far '
        'beyond a narrow validated range is rejected', () {
      const narrowRangeCoefficients = LengthWeightCoefficients(
        speciesId: 'white_steenbras',
        scientificName: 'Lithognathus lithognathus',
        displayName: 'White Steenbras',
        a: 0.0233,
        b: 3.011,
        lengthType: LengthType.standardLength,
        lengthUnit: 'cm',
        weightUnit: 'g',
        minValidatedLengthCm: 1.3,
        maxValidatedLengthCm: 46.5,
        sampleSize: 647,
        rSquared: 0.996,
        sourceCitation: 'Harrison (2001)',
      );

      final result = calculator.calculate(
        coefficients: narrowRangeCoefficients,
        length: 90,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.aboveValidatedRange);
      expect(result.estimatedWeightGrams, isNull);
    });

    test('boundary value at exactly the minimum is accepted (inclusive)',
        () {
      final result = calculator.calculate(
        coefficients: _stumpnose,
        length: 1.1,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.success);
      expect(result.estimatedWeightGrams, closeTo(0.03650464, 1e-6));
    });

    test('boundary value at exactly the maximum is accepted (inclusive)',
        () {
      final result = calculator.calculate(
        coefficients: _grunter,
        length: 64.0,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.success);
      expect(result.estimatedWeightGrams, closeTo(5501.64277591, 1e-3));
    });

    test('just below the minimum boundary is rejected', () {
      final result = calculator.calculate(
        coefficients: _stumpnose,
        length: 1.0,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.belowValidatedRange);
    });

    test('just above the maximum boundary is rejected', () {
      final result = calculator.calculate(
        coefficients: _grunter,
        length: 64.1,
        unit: LengthUnit.centimetres,
      );

      expect(result.outcome, LengthWeightEstimateOutcome.aboveValidatedRange);
    });
  });

  group('LengthWeightCoefficients.isWithinValidatedRange', () {
    test('reports true within range, false outside it', () {
      expect(_stumpnose.isWithinValidatedRange(10), isTrue);
      expect(_stumpnose.isWithinValidatedRange(0.5), isFalse);
      expect(_stumpnose.isWithinValidatedRange(30), isFalse);
    });
  });
}
