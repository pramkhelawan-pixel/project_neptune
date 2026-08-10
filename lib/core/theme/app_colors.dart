import 'package:flutter/material.dart';

/// Neptune's "Abyssal Gold" palette — deep navy base with brass reserved
/// for moments that matter (Readiness, high-confidence calls, celebrations).
/// [warning]/[warningStrong] are held identical to the existing
/// regulatory-notice amber (Colors.amber.shade800/900) by design — see
/// species_detail_page.dart's _RegulatoryNoticeSection.
class AppColors {
  AppColors._();

  static const Color base = Color(0xFF060E1F);
  static const Color surface1 = Color(0xFF0F1D38);
  static const Color surface2 = Color(0xFF17284A);
  static const Color surface3 = Color(0xFF1F3358);

  static const Color hairline = Color(0x4DD4A017); // brass @ 30% alpha

  static const Color brass = Color(0xFFD4A017);
  static const Color brassBright = Color(0xFFF5C242);
  static const Color brassWash = Color(0x1AD4A017); // brass @ 10% alpha

  /// The theme's `primary` seed — brass, not blue. Kept under this name
  /// (rather than just `brass`) because primary_button.dart and
  /// neptune_logo.dart already read AppColors.primary as "the app's
  /// signature color", which brass now is.
  static const Color primary = brass;

  static const Color warning = Color(0xFFFF8F00); // Material amber800
  static const Color warningStrong = Color(0xFFFF6F00); // Material amber900
  static const Color warningWash = Color(0x24FF8F00); // warning @ 14% alpha

  static const Color success = Color(0xFF2E9166);
  static const Color critical = Color(0xFFD14B3B);

  static const Color textPrimary = Color(0xFFF7F5F0);

  /// Verified 9.42:1 against [surface1] (WCAG AA needs 4.5:1) — raised from
  /// an earlier #7C8BAE (4.92:1, too little headroom for outdoor glare).
  static const Color textSecondary = Color(0xFFB7C2E0);

  /// Verified 6.07:1 against [surface1] — raised from an earlier #536080,
  /// which measured 2.68:1 and failed WCAG AA outright.
  static const Color textTertiary = Color(0xFF8D9BC2);
}