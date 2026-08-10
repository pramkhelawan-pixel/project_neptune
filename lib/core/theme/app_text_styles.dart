import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _fraunces = 'Fraunces';
  static const String _manrope = 'Manrope';

  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fraunces,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fraunces,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fraunces,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  /// Hero numerals — the Readiness score, and anywhere else a number is
  /// the whole point. Tabular figures so digits don't shift width.
  static const TextStyle scoreDisplay = TextStyle(
    fontFamily: _fraunces,
    fontSize: 56,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _manrope,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _manrope,
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontFamily: _manrope,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.base,
  );

  static const TextStyle label = TextStyle(
    fontFamily: _manrope,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
}