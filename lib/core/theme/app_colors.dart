import 'package:flutter/material.dart';

/// PELAV's colour tokens — deep navy base with Sand Gold reserved for
/// moments that matter (Readiness, high-confidence calls, celebrations).
///
/// Migrated from the earlier "Abyssal Gold" (Neptune) palette. [brass],
/// [brassBright] and [brassWash] are kept as deprecated aliases for
/// [primary], [primaryBright] and a primary-derived wash respectively, so
/// existing call sites keep compiling and rendering correctly until they
/// are individually migrated onto the semantic names.
class AppColors {
  AppColors._();

  // Surfaces
  static const Color base = Color(0xFF0B1D2D);
  static const Color surface1 = Color(0xFF0F273E);

  /// Widened from the original 0xFF143150 for more visible layering
  /// against [base]/[surface1] (luminance delta from base: 0.0250 vs the
  /// original 0.0179). [surface1]'s own contrast guarantees are untouched
  /// since this token, not [surface1], moved.
  static const Color surface2 = Color(0xFF163564);

  /// Widened from the original 0xFF183C61, same reasoning as [surface2]
  /// (luminance delta from base: 0.0415 vs the original 0.0315). Used only
  /// as the Readiness dial's decorative track ring
  /// (readiness_dial_painter.dart) — no text or icon is ever painted on
  /// this colour, so it carries no WCAG text-contrast obligation.
  static const Color surface3 = Color(0xFF1A4270);

  static const Color hairline = Color(0x4DDFAE4A); // primary @ 30% alpha

  // Brand accents
  /// Richer, more saturated Sand Gold (58.5%→70.0% HSL saturation,
  /// 63.1%→58.2% lightness, hue held at ~40°) — replaces a value that
  /// read as pale/beige on physical-device review. Verified 8.38:1 on
  /// [base] in both directions (button text and icon/border/hairline use)
  /// and 7.46:1 on [surface1] — comfortably above WCAG AA's 4.5:1
  /// everywhere this token is used as text, icon, or border.
  static const Color primary = Color(0xFFDFAE4A); // Sand Gold

  /// Brightened alongside [primary] (64.6%→80.1% saturation) so the
  /// Readiness dial's glow reads as genuinely luminous rather than a
  /// washed-out highlight sitting close to [primary] in value. Purely
  /// decorative (dial glow only) — no WCAG obligation.
  static const Color primaryBright = Color(0xFFEFCB6E);
  static const Color secondary = Color(0xFF1AA39A); // Sea Teal

  /// Alias for [primary] in dark mode — the vibrant gold already passes
  /// WCAG AA as foreground-on-dark (8.38:1 on [base], 7.46:1 on
  /// [surface1]), so no separate deeper value is needed here. A distinct
  /// value only exists in [AppColorsLight], where the same vibrant gold
  /// fails as foreground against a light background. See
  /// [AppColorsLight.primaryForeground] for the full explanation.
  static const Color primaryForeground = primary;

  /// Ocean Blue — supporting surface/decorative colour only. Verified
  /// 1.89:1 as foreground text/icon on [base] (WCAG AA needs 4.5:1) — must
  /// never be assigned as a text or icon colour on the navy base.
  static const Color accent = Color(0xFF1E4A7A);

  /// Deprecated alias for [primary] — kept so existing call sites
  /// (readiness_dial_painter.dart, app_theme.dart) keep compiling and
  /// rendering correctly. New code should read [primary] directly.
  static const Color brass = primary;

  /// Deprecated alias for [primaryBright]. New code should read
  /// [primaryBright] directly.
  static const Color brassBright = primaryBright;

  /// Deprecated alias for a primary-derived wash. New code should derive
  /// a wash from [primary] directly rather than reading this name.
  static const Color brassWash = Color(0x1ADFAE4A); // primary @ 10% alpha

  /// Same value as [brassWash] under the non-deprecated name — see
  /// [AppColorsLight.goldWash] for why light mode needs its own entry here
  /// (it doesn't; both themes use [primary] @ 10% alpha for this role).
  static const Color goldWash = brassWash;

  // Functional / status colours — deliberately independent of the five
  // brand hues so colour-blind users retain the green/red distinction.
  // Every value below was verified against [base] and [surface1] at
  // WCAG AA (4.5:1) before being locked in.

  /// Verified 6.93:1 against [base], 6.17:1 against [surface1].
  static const Color success = Color(0xFF3CBA7D);

  /// Verified 7.53:1 against [base], 6.70:1 against [surface1].
  static const Color warning = Color(0xFFE0A030);

  /// Verified 5.12:1 against [base], 4.55:1 against [surface1].
  static const Color warningStrong = Color(0xFFC97A1E);

  static const Color warningWash = Color(0x24E0A030); // warning @ 14% alpha

  /// Verified 5.20:1 against [base], 4.63:1 against [surface1].
  static const Color critical = Color(0xFFE66651);

  /// Deliberately identical to [critical] — a separate token name only so
  /// `ColorScheme.error`/form-validation call sites read semantically
  /// correctly in code, not a visually distinct colour.
  static const Color error = critical;

  // Pale status-chip backgrounds. Always pair with [paleChipText] — never
  // with the status colour itself. [warningStrong] on [paleWarningBg]
  // measures 2.71:1 and [critical] on [paleCriticalBg] measures 2.53:1,
  // both failing WCAG AA outright; [paleChipText] on either measures
  // >13:1.
  static const Color paleWarningBg = Color(0xFFEEE7D8);
  static const Color paleCriticalBg = Color(0xFFEFDEDD);
  static const Color paleChipText = base;

  static const Color textPrimary = Color(0xFFF1F3F6);

  /// Verified 8.57:1 against [surface1] (WCAG AA needs 4.5:1).
  static const Color textSecondary = Color(0xFFB6C4D3);

  /// Verified 5.79:1 against [surface1] — AA, not AAA, by design (lowest
  /// text tier).
  static const Color textTertiary = Color(0xFF8CA2BA);
}
