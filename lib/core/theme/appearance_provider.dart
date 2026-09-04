import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'appearance_repository.dart';

part 'appearance_provider.g.dart';

@riverpod
AppearanceRepository appearanceRepository(Ref ref) => AppearanceRepository();

/// The user's chosen appearance, read from and persisted to
/// [AppearanceRepository]. [build] resolves once from storage (typically
/// near-instant on-device, so the brief loading gap before it resolves is
/// not specially handled -- [NeptuneApp] falls back to [ThemeMode.system]
/// while this is loading, which is also the correct first-launch default).
@riverpod
class AppearanceModeController extends _$AppearanceModeController {
  @override
  Future<ThemeMode> build() {
    return ref.read(appearanceRepositoryProvider).getThemeMode();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final repository = ref.read(appearanceRepositoryProvider);
    await repository.saveThemeMode(mode);
    state = AsyncData(mode);
  }
}
