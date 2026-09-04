import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_colors_light.dart';

/// The theme-reactive bundle of PELAV's design tokens. [AppColors] and
/// [AppColorsLight] are compile-time constants — fine for building each
/// theme's [ThemeData] (app_theme.dart knows which one it's building), but
/// useless for a widget that needs "whichever theme is active right now"
/// without threading that decision through every constructor. [PelavColors]
/// is that per-widget lookup: it's a [ThemeExtension] registered on both
/// [ThemeData.extensions], so `context.colors.X` always resolves to the
/// active theme's value.
///
/// Only fields that a widget outside app_theme.dart/app_colors.dart
/// actually reads directly are included here — see Step 8C/8D's colour
/// audit. Roles fully absorbed by [ColorScheme]/[TextTheme]/component
/// ThemeData (buttons, inputs, cards, chips, nav, dialogs) don't need a
/// mirror here; they already re-theme automatically.
class PelavColors extends ThemeExtension<PelavColors> {
  const PelavColors({
    required this.base,
    required this.surface1,
    required this.surface2,
    required this.surface3,
    required this.hairline,
    required this.primary,
    required this.primaryForeground,
    required this.primaryBright,
    required this.secondary,
    required this.accent,
    required this.success,
    required this.warning,
    required this.warningStrong,
    required this.critical,
    required this.error,
    required this.paleWarningBg,
    required this.paleCriticalBg,
    required this.paleChipText,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.goldWash,
  });

  final Color base;
  final Color surface1;
  final Color surface2;
  final Color surface3;
  final Color hairline;
  final Color primary;
  final Color primaryForeground;
  final Color primaryBright;
  final Color secondary;
  final Color accent;
  final Color success;
  final Color warning;
  final Color warningStrong;
  final Color critical;
  final Color error;
  final Color paleWarningBg;
  final Color paleCriticalBg;
  final Color paleChipText;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color goldWash;

  static const dark = PelavColors(
    base: AppColors.base,
    surface1: AppColors.surface1,
    surface2: AppColors.surface2,
    surface3: AppColors.surface3,
    hairline: AppColors.hairline,
    primary: AppColors.primary,
    primaryForeground: AppColors.primaryForeground,
    primaryBright: AppColors.primaryBright,
    secondary: AppColors.secondary,
    accent: AppColors.accent,
    success: AppColors.success,
    warning: AppColors.warning,
    warningStrong: AppColors.warningStrong,
    critical: AppColors.critical,
    error: AppColors.error,
    paleWarningBg: AppColors.paleWarningBg,
    paleCriticalBg: AppColors.paleCriticalBg,
    paleChipText: AppColors.paleChipText,
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    textTertiary: AppColors.textTertiary,
    goldWash: AppColors.goldWash,
  );

  static const light = PelavColors(
    base: AppColorsLight.base,
    surface1: AppColorsLight.surface1,
    surface2: AppColorsLight.surface2,
    surface3: AppColorsLight.surface3,
    hairline: AppColorsLight.hairline,
    primary: AppColorsLight.primary,
    primaryForeground: AppColorsLight.primaryForeground,
    primaryBright: AppColorsLight.primaryBright,
    secondary: AppColorsLight.secondary,
    accent: AppColorsLight.accent,
    success: AppColorsLight.success,
    warning: AppColorsLight.warning,
    warningStrong: AppColorsLight.warningStrong,
    critical: AppColorsLight.critical,
    error: AppColorsLight.error,
    paleWarningBg: AppColorsLight.paleWarningBg,
    paleCriticalBg: AppColorsLight.paleCriticalBg,
    paleChipText: AppColorsLight.paleChipText,
    textPrimary: AppColorsLight.textPrimary,
    textSecondary: AppColorsLight.textSecondary,
    textTertiary: AppColorsLight.textTertiary,
    goldWash: AppColorsLight.goldWash,
  );

  @override
  PelavColors copyWith({
    Color? base,
    Color? surface1,
    Color? surface2,
    Color? surface3,
    Color? hairline,
    Color? primary,
    Color? primaryForeground,
    Color? primaryBright,
    Color? secondary,
    Color? accent,
    Color? success,
    Color? warning,
    Color? warningStrong,
    Color? critical,
    Color? error,
    Color? paleWarningBg,
    Color? paleCriticalBg,
    Color? paleChipText,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? goldWash,
  }) {
    return PelavColors(
      base: base ?? this.base,
      surface1: surface1 ?? this.surface1,
      surface2: surface2 ?? this.surface2,
      surface3: surface3 ?? this.surface3,
      hairline: hairline ?? this.hairline,
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      primaryBright: primaryBright ?? this.primaryBright,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      warningStrong: warningStrong ?? this.warningStrong,
      critical: critical ?? this.critical,
      error: error ?? this.error,
      paleWarningBg: paleWarningBg ?? this.paleWarningBg,
      paleCriticalBg: paleCriticalBg ?? this.paleCriticalBg,
      paleChipText: paleChipText ?? this.paleChipText,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      goldWash: goldWash ?? this.goldWash,
    );
  }

  // Theme-mode switches are instant (no cross-fade), so interpolation is
  // deliberately not implemented -- the usual "at the midpoint, snap to
  // whichever side we're animating toward" shortcut is enough.
  @override
  PelavColors lerp(ThemeExtension<PelavColors>? other, double t) {
    if (other is! PelavColors) return this;
    return t < 0.5 ? this : other;
  }
}

extension PelavColorsContext on BuildContext {
  /// The active theme's PELAV design tokens, e.g. `context.colors.primary`.
  PelavColors get colors => Theme.of(this).extension<PelavColors>()!;
}
