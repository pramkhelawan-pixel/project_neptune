import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local-only persistence for the user's chosen appearance (System/Light/
/// Dark). Mirrors [LicenceRepositoryImpl]'s established pattern in this
/// codebase -- a versioned [SharedPreferences] string key, no injected
/// dependencies, `SharedPreferences.getInstance()` awaited per call.
class AppearanceRepository {
  static const _key = 'appearance_mode_v1';

  /// Defaults to [ThemeMode.system] when nothing has been saved yet, or
  /// when the stored value is missing/unrecognised (e.g. written by a
  /// future app version with a mode this version doesn't know).
  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);

    if (stored == null) {
      return ThemeMode.system;
    }

    try {
      return ThemeMode.values.byName(stored);
    } on ArgumentError {
      return ThemeMode.system;
    }
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
  }
}
