import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:project_neptune/core/theme/appearance_repository.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('AppearanceRepository', () {
    test('getThemeMode defaults to system when nothing has been saved', () async {
      final result = await AppearanceRepository().getThemeMode();

      expect(result, ThemeMode.system);
    });

    test('getThemeMode defaults to system for an invalid/unrecognised stored '
        'value', () async {
      SharedPreferences.setMockInitialValues({
        'appearance_mode_v1': 'not-a-real-theme-mode',
      });

      final result = await AppearanceRepository().getThemeMode();

      expect(result, ThemeMode.system);
    });

    test('saveThemeMode(light) persists, readable by a new instance', () async {
      await AppearanceRepository().saveThemeMode(ThemeMode.light);

      final result = await AppearanceRepository().getThemeMode();

      expect(result, ThemeMode.light);
    });

    test('saveThemeMode(dark) persists, readable by a new instance', () async {
      await AppearanceRepository().saveThemeMode(ThemeMode.dark);

      final result = await AppearanceRepository().getThemeMode();

      expect(result, ThemeMode.dark);
    });

    test('saveThemeMode(system) persists, readable by a new instance', () async {
      await AppearanceRepository().saveThemeMode(ThemeMode.system);

      final result = await AppearanceRepository().getThemeMode();

      expect(result, ThemeMode.system);
    });

    test('a later save overwrites an earlier one', () async {
      final repository = AppearanceRepository();

      await repository.saveThemeMode(ThemeMode.dark);
      await repository.saveThemeMode(ThemeMode.light);

      expect(await repository.getThemeMode(), ThemeMode.light);
    });
  });
}
