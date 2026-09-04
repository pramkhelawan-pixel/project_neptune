import 'package:flutter/material.dart';

/// PELAV's light-theme colour tokens — a deliberate light palette, not an
/// inversion of [AppColors]. Every field name here mirrors a field in
/// [AppColors] one-for-one (see that file for the dark equivalents); the
/// pairing is what [PelavColors] (pelav_colors.dart) uses to build the
/// theme-reactive bundle each screen actually reads from at runtime.
///
/// [primary] keeps the same Sand Gold used in dark mode — it is only ever
/// used as a filled BACKGROUND (buttons, the selected nav indicator) with
/// deep-navy text on top, and that pairing already passes WCAG AA against
/// dark navy regardless of which theme is active. [primaryForeground] is a
/// separate, deeper gold used wherever gold is the FOREGROUND (icon, text,
/// border) sitting on a light surface — the vibrant background gold fails
/// WCAG AA at that job on a light background (verified 3.69:1 on white,
/// needs 4.5:1), so a darker semantic gold is used there instead, per the
/// project's own design direction. In dark mode [AppColors.primaryForeground]
/// is simply an alias for [AppColors.primary], since the vibrant gold
/// already passes both jobs against a dark background.
class AppColorsLight {
  AppColorsLight._();

  // Surfaces — a cool, barely-tinted "sea mist" background with cards
  // popping forward in pure white, not a generic Material light grey and
  // not stark/clinical white throughout.
  static const Color base = Color(0xFFF3F6F9);
  static const Color surface1 = Color(0xFFFFFFFF);
  static const Color surface2 = Color(0xFFE4ECF3);

  /// Decorative only (Readiness dial track ring) — see [AppColors.surface3].
  static const Color surface3 = Color(0xFFD3E0EB);

  /// [primaryForeground] @ 30% alpha — mirrors [AppColors.hairline]'s
  /// derivation, just from the light theme's deeper foreground gold instead
  /// of the vibrant background gold (which would be nearly invisible at low
  /// alpha against a white card).
  static const Color hairline = Color(0x4D8A5D14);

  // Brand accents
  /// Same Sand Gold as [AppColors.primary] — background-fill role only, see
  /// class doc.
  static const Color primary = Color(0xFFDFAE4A);

  /// Deep bronze-gold. Verified 5.74:1 on [surface1], 5.30:1 on [base],
  /// 4.81:1 on [surface2] — all above WCAG AA's 4.5:1. This is the "darker
  /// semantic gold" the design direction calls for when Sand Gold itself is
  /// insufficient as foreground on a light background.
  static const Color primaryForeground = Color(0xFF8A5D14);

  /// Decorative only (Readiness dial glow) — sits between [primary] and
  /// [primaryForeground] in depth so the glow reads as a warm halo against
  /// a white card rather than washing out the way the lighter dark-mode
  /// value would. No WCAG obligation (never text/icon).
  static const Color primaryBright = Color(0xFFC79340);

  /// Deepened from [AppColors.secondary] for the same reason as the status
  /// colours below — decorative/ColorScheme-only today, but given real
  /// foreground headroom (6.09:1 on surface1) rather than left at the dark
  /// value's much weaker light-background contrast.
  static const Color secondary = Color(0xFF0C6E68);

  /// Ocean Blue — same value as [AppColors.accent]. Decorative/supporting
  /// only in both themes (never assigned as text/icon colour), so no
  /// light-specific adjustment is needed.
  static const Color accent = Color(0xFF1E4A7A);

  // Functional / status colours — same hue family as their [AppColors]
  // counterparts (colour-blind distinction preserved), deepened for
  // foreground legibility against light surfaces. Every value below was
  // verified against [surface1], [base] and [surface2] at WCAG AA (4.5:1).

  /// Verified 6.14:1 on [surface1], 5.66:1 on [base], 5.14:1 on [surface2].
  static const Color success = Color(0xFF15703F);

  /// Verified 5.92:1 on [surface1], 5.46:1 on [base], 4.96:1 on [surface2].
  static const Color warning = Color(0xFF8A5A0A);

  /// Verified 8.49:1 on [surface1], 7.83:1 on [base].
  static const Color warningStrong = Color(0xFF6E4310);

  static const Color warningWash = Color(0x248A5A0A); // warning @ 14% alpha

  /// Verified 6.84:1 on [surface1], 6.31:1 on [base], 5.73:1 on [surface2].
  static const Color critical = Color(0xFFA82E18);

  /// Deliberately identical to [critical] — same reasoning as
  /// [AppColors.error].
  static const Color error = critical;

  // Pale status-chip backgrounds — NOT a mechanical reuse of the dark
  // tokens (those are near-white and would nearly vanish against an
  // already-light page). Deepened just enough to read as a distinct tinted
  // chip against [base]/[surface1] while staying "pale" relative to the
  // full-saturation status colour. Always pair with [paleChipText].
  static const Color paleWarningBg = Color(0xFFF3E3C4);
  static const Color paleCriticalBg = Color(0xFFF6DAD3);

  /// Fixed deep-navy ink — intentionally references [textPrimary] here,
  /// NOT [base] (unlike [AppColors.paleChipText], which safely aliases
  /// [AppColors.base] because dark mode's base already *is* deep navy).
  /// Light mode's [base] is pale, so aliasing it here would put pale text
  /// on a pale chip. Verified 13.52:1 on [paleWarningBg], 12.94:1 on
  /// [paleCriticalBg].
  static const Color paleChipText = textPrimary;

  /// Reused verbatim from [AppColors.textPrimary] — deep navy ink is the
  /// same brand "ink" in both themes, just on different "paper".
  static const Color textPrimary = Color(0xFF0B1D2D);

  /// Verified 9.43:1 against [surface1], 8.69:1 against [base], 7.90:1
  /// against [surface2].
  static const Color textSecondary = Color(0xFF2F4863);

  /// Verified 5.56:1 against [surface1], 5.13:1 against [base], 4.66:1
  /// against [surface2] — AA, not AAA, by design, same precedent as
  /// [AppColors.textTertiary].
  static const Color textTertiary = Color(0xFF516B82);

  /// Soft gold-tinted wash for decorative chip/tag backgrounds (e.g. a
  /// species distribution-region tag) — see [AppColors.goldWash]. Uses
  /// [primary] (not [primaryForeground]) since this is a background wash
  /// with no text painted directly on it; the wash itself carries no WCAG
  /// obligation.
  static const Color goldWash = Color(0x1ADFAE4A); // primary @ 10% alpha
}
