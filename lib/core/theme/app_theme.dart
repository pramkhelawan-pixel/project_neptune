import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static const _fraunces = 'Fraunces';
  static const _manrope = 'Manrope';

  /// Deliberately the app's only theme — a dark, brass-on-navy identity,
  /// not a light/dark pair. See visual-direction proposal (Abyssal Gold).
  static ThemeData get neptune {
    final textTheme = TextTheme(
      displayLarge: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 96, color: AppColors.textPrimary),
      displayMedium: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 56, color: AppColors.textPrimary),
      displaySmall: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 40, color: AppColors.textPrimary),
      headlineLarge: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 32, color: AppColors.textPrimary),
      headlineMedium: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 26, color: AppColors.textPrimary),
      headlineSmall: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 22, color: AppColors.textPrimary),
      titleLarge: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.textPrimary),
      titleMedium: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w600, fontSize: 17, color: AppColors.textPrimary),
      titleSmall: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary),
      bodyLarge: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.textPrimary),
      bodyMedium: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textSecondary),
      bodySmall: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w400, fontSize: 12.5, color: AppColors.textTertiary),
      labelLarge: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700, fontSize: 13, letterSpacing: 0.02, color: AppColors.textPrimary),
      labelMedium: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700, fontSize: 11.5, letterSpacing: 0.08, color: AppColors.brass),
      labelSmall: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w600, fontSize: 11, letterSpacing: 0.1, color: AppColors.textTertiary),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: _manrope,
      textTheme: textTheme,

      // primary/secondary/tertiaryContainer are pinned explicitly, not
      // left to fromSeed's auto-derived tonal palette — a warm brass seed
      // at dark brightness produces a muddy olive-brown for these roles,
      // which several stock widgets default to when unthemed
      // (FloatingActionButton, CircleAvatar, and — before navigationBarTheme/
      // segmentedButtonTheme below existed — NavigationBar/SegmentedButton
      // too). Pinning here is the one place that fixes every current and
      // future default-consumer at once, rather than chasing each widget.
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.brass,
        brightness: Brightness.dark,
        primary: AppColors.brass,
        onPrimary: AppColors.base,
        primaryContainer: AppColors.brass,
        onPrimaryContainer: AppColors.base,
        secondary: AppColors.brassBright,
        secondaryContainer: AppColors.surface2,
        onSecondaryContainer: AppColors.textPrimary,
        tertiary: AppColors.brassBright,
        tertiaryContainer: AppColors.surface2,
        onTertiaryContainer: AppColors.textPrimary,
        surface: AppColors.surface1,
        onSurface: AppColors.textPrimary,
        error: AppColors.critical,
        onError: AppColors.textPrimary,
      ),

      scaffoldBackgroundColor: AppColors.base,

      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.base,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: TextStyle(
          fontFamily: _fraunces,
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: AppColors.textPrimary,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface1,
        labelStyle: const TextStyle(fontFamily: _manrope, color: AppColors.textSecondary),
        hintStyle: const TextStyle(fontFamily: _manrope, color: AppColors.textTertiary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.hairline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.hairline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.brass,
            width: 2,
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          backgroundColor: AppColors.brass,
          foregroundColor: AppColors.base,
          textStyle: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.surface1,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AppColors.hairline),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.hairline,
        thickness: 1,
        space: 1,
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surface2,
        labelStyle: const TextStyle(fontFamily: _manrope, fontSize: 12.5, color: AppColors.textPrimary),
        side: const BorderSide(color: AppColors.hairline),
        shape: const StadiumBorder(),
      ),

      // Pinned explicitly rather than left to ColorScheme.fromSeed's
      // auto-derived tonal surfaces — ColorScheme.fromSeed(brightness:
      // dark) with a warm brass seed produces muddy olive-brown
      // surfaceContainer/secondaryContainer tones for exactly these two
      // widgets, which read as a bug, not the intended navy/brass identity.
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface1,
        indicatorColor: AppColors.brass,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontFamily: _manrope,
            fontSize: 11,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected ? AppColors.base : AppColors.textSecondary,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? AppColors.base : AppColors.textSecondary,
          );
        }),
      ),

      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? AppColors.brass
                : AppColors.surface1;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? AppColors.base
                : AppColors.textSecondary;
          }),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w600, fontSize: 13),
          ),
          side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.hairline),
          ),
        ),
      ),
    );
  }
}