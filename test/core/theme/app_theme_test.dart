import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/core/theme/app_colors.dart';
import 'package:project_neptune/core/theme/app_theme.dart';
import 'package:project_neptune/core/theme/pelav_colors.dart';

void main() {
  group('AppTheme.neptune (dark)', () {
    test('is unchanged: still Brightness.dark', () {
      expect(AppTheme.neptune.brightness, Brightness.dark);
    });

    test('carries a PelavColors extension matching AppColors exactly -- a '
        'regression guard against the mirror drifting from the source of '
        'truth', () {
      final colors = AppTheme.neptune.extension<PelavColors>();

      expect(colors, isNotNull);
      expect(colors!.base, AppColors.base);
      expect(colors.surface1, AppColors.surface1);
      expect(colors.primary, AppColors.primary);
      expect(colors.primaryForeground, AppColors.primaryForeground);
      expect(colors.success, AppColors.success);
      expect(colors.warning, AppColors.warning);
      expect(colors.critical, AppColors.critical);
      expect(colors.textPrimary, AppColors.textPrimary);
    });
  });

  group('AppTheme.light', () {
    test('is a genuine light theme: Brightness.light', () {
      expect(AppTheme.light.brightness, Brightness.light);
    });

    test('carries a light PelavColors extension, distinct from dark', () {
      final colors = AppTheme.light.extension<PelavColors>();

      expect(colors, isNotNull);
      expect(colors!.base, isNot(AppColors.base));
      expect(colors.textPrimary, AppColors.base);
    });

    test('primaryForeground differs from primary (deeper gold needed for '
        'foreground legibility on a light background) -- unlike dark mode, '
        'where they are the same value', () {
      final colors = AppTheme.light.extension<PelavColors>()!;

      expect(colors.primaryForeground, isNot(colors.primary));
    });
  });
}
