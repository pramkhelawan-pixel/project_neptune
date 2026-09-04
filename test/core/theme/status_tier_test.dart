import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/core/theme/app_colors.dart';
import 'package:project_neptune/core/theme/status_tier.dart';

void main() {
  group('StatusTier.color', () {
    test('success resolves to AppColors.success', () {
      expect(StatusTier.success.color, AppColors.success);
    });

    test('warning resolves to AppColors.warning', () {
      expect(StatusTier.warning.color, AppColors.warning);
    });

    test('critical resolves to AppColors.critical', () {
      expect(StatusTier.critical.color, AppColors.critical);
    });
  });

  group('StatusTier.forSpeciesScore', () {
    test('80 -> success', () {
      expect(StatusTier.forSpeciesScore(80), StatusTier.success);
    });

    test('79 -> success', () {
      expect(StatusTier.forSpeciesScore(79), StatusTier.success);
    });

    test('60 -> success', () {
      expect(StatusTier.forSpeciesScore(60), StatusTier.success);
    });

    test('59 -> warning', () {
      expect(StatusTier.forSpeciesScore(59), StatusTier.warning);
    });

    test('40 -> warning', () {
      expect(StatusTier.forSpeciesScore(40), StatusTier.warning);
    });

    test('39 -> critical', () {
      expect(StatusTier.forSpeciesScore(39), StatusTier.critical);
    });
  });
}
