import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:project_neptune/core/theme/appearance_provider.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('AppearanceModeController', () {
    test('build defaults to ThemeMode.system on first launch (nothing '
        'persisted)', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final result =
          await container.read(appearanceModeControllerProvider.future);

      expect(result, ThemeMode.system);
    });

    test('build resolves a persisted light selection', () async {
      SharedPreferences.setMockInitialValues({
        'appearance_mode_v1': 'light',
      });
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final result =
          await container.read(appearanceModeControllerProvider.future);

      expect(result, ThemeMode.light);
    });

    test('build resolves a persisted dark selection', () async {
      SharedPreferences.setMockInitialValues({
        'appearance_mode_v1': 'dark',
      });
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final result =
          await container.read(appearanceModeControllerProvider.future);

      expect(result, ThemeMode.dark);
    });

    test('build resolves a persisted system selection', () async {
      SharedPreferences.setMockInitialValues({
        'appearance_mode_v1': 'system',
      });
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final result =
          await container.read(appearanceModeControllerProvider.future);

      expect(result, ThemeMode.system);
    });

    test('an invalid/missing persisted value resolves safely to system',
        () async {
      SharedPreferences.setMockInitialValues({
        'appearance_mode_v1': 'sepia',
      });
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final result =
          await container.read(appearanceModeControllerProvider.future);

      expect(result, ThemeMode.system);
    });

    test('setThemeMode updates state immediately (no re-read needed) and '
        'persists the new value', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(appearanceModeControllerProvider.future);

      await container
          .read(appearanceModeControllerProvider.notifier)
          .setThemeMode(ThemeMode.dark);

      // Immediate state change: the container's current value reflects the
      // new mode without needing to await another async resolution.
      expect(
        container.read(appearanceModeControllerProvider).value,
        ThemeMode.dark,
      );

      // And it's durable: a fresh container (simulating an app restart)
      // reads the same persisted value back.
      final restarted = ProviderContainer();
      addTearDown(restarted.dispose);
      expect(
        await restarted.read(appearanceModeControllerProvider.future),
        ThemeMode.dark,
      );
    });

    test('changing mode twice leaves the most recent selection in effect',
        () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(appearanceModeControllerProvider.future);
      final notifier =
          container.read(appearanceModeControllerProvider.notifier);

      await notifier.setThemeMode(ThemeMode.light);
      await notifier.setThemeMode(ThemeMode.dark);

      expect(
        container.read(appearanceModeControllerProvider).value,
        ThemeMode.dark,
      );
    });
  });
}
