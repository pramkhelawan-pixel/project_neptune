import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_colors_light.dart';
import 'pelav_colors.dart';

class AppTheme {
  AppTheme._();

  static const _fraunces = 'Fraunces';
  static const _manrope = 'Manrope';

  /// Deliberately the app's only theme — a dark, PELAV navy/gold identity,
  /// not a light/dark pair. Typography (Fraunces/Manrope) is unchanged in
  /// this pass — only colour tokens were migrated; the font migration is a
  /// separate, later step.
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
      labelMedium: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700, fontSize: 11.5, letterSpacing: 0.08, color: AppColors.primary),
      labelSmall: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w600, fontSize: 11, letterSpacing: 0.1, color: AppColors.textTertiary),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: _manrope,
      textTheme: textTheme,

      // primary/secondary/tertiaryContainer are pinned explicitly, not
      // left to fromSeed's auto-derived tonal palette — a warm gold seed
      // at dark brightness produces a muddy olive-brown for these roles,
      // which several stock widgets default to when unthemed
      // (FloatingActionButton, CircleAvatar, and — before navigationBarTheme/
      // segmentedButtonTheme below existed — NavigationBar/SegmentedButton
      // too). Pinning here is the one place that fixes every current and
      // future default-consumer at once, rather than chasing each widget.
      //
      // secondary/secondaryContainer now route to AppColors.secondary (Sea
      // Teal) — the approved PELAV palette's dedicated secondary accent.
      // tertiary intentionally stays gold-family (AppColors.primaryBright),
      // not AppColors.accent (Ocean Blue): Ocean Blue is verified 1.89:1 as
      // foreground-on-navy (fails WCAG AA outright) and must never be
      // assigned to a ColorScheme role a stock widget could use as a
      // text/icon colour — see app_colors.dart's [accent] doc comment.
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: AppColors.base,
        primaryContainer: AppColors.primary,
        onPrimaryContainer: AppColors.base,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.surface2,
        onSecondaryContainer: AppColors.textPrimary,
        tertiary: AppColors.primaryBright,
        tertiaryContainer: AppColors.surface2,
        onTertiaryContainer: AppColors.textPrimary,
        surface: AppColors.surface1,
        onSurface: AppColors.textPrimary,
        onSurfaceVariant: AppColors.textSecondary,
        error: AppColors.error,
        onError: AppColors.textPrimary,
        errorContainer: AppColors.paleCriticalBg,
        onErrorContainer: AppColors.paleChipText,
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
        helperStyle: const TextStyle(fontFamily: _manrope, color: AppColors.textTertiary),
        errorStyle: const TextStyle(fontFamily: _manrope, color: AppColors.critical),
        prefixIconColor: AppColors.textSecondary,
        suffixIconColor: AppColors.textSecondary,
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
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.critical,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.critical,
            width: 2,
          ),
        ),
      ),

      // AppTextField's own cursor is unset today, so it falls through to
      // this theme-level default rather than needing any change to
      // app_text_field.dart itself.
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.base,
          textStyle: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.base,
          textStyle: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          textStyle: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      // Foreground defaults to primary; destructive actions (e.g. the
      // existing Delete Account/Delete Licence/Cancel dialogs) continue to
      // explicitly set `foregroundColor: colorScheme.error` per-call-site,
      // exactly as they already do today — that pattern is unchanged here.
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      // Elevation intentionally NOT set to 0 here — cards/AppBar/NavigationBar
      // are deliberately flat, but a dialog floats above page content, so
      // Material's default dialog elevation is preserved rather than
      // flattened to match the card system.
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surface1,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.surface1,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AppColors.hairline, width: 1),
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
      // dark) with a warm gold seed produces muddy olive-brown
      // surfaceContainer/secondaryContainer tones for exactly these two
      // widgets, which read as a bug, not the intended navy/gold identity.
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface1,
        indicatorColor: AppColors.primary,
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
                ? AppColors.primary
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

      extensions: const [PelavColors.dark],
    );
  }

  /// A genuine PELAV light theme, not an inverted [neptune] -- see
  /// [AppColorsLight]'s class doc for the reasoning behind its token
  /// choices (in particular the primary/primaryForeground split, which
  /// [neptune] above doesn't need). Structure deliberately mirrors
  /// [neptune] block-for-block so the two stay easy to compare; only the
  /// colour source and [Brightness] differ.
  static ThemeData get light {
    final textTheme = TextTheme(
      displayLarge: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 96, color: AppColorsLight.textPrimary),
      displayMedium: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 56, color: AppColorsLight.textPrimary),
      displaySmall: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 40, color: AppColorsLight.textPrimary),
      headlineLarge: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 32, color: AppColorsLight.textPrimary),
      headlineMedium: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 26, color: AppColorsLight.textPrimary),
      headlineSmall: const TextStyle(fontFamily: _fraunces, fontWeight: FontWeight.w600, fontSize: 22, color: AppColorsLight.textPrimary),
      titleLarge: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700, fontSize: 20, color: AppColorsLight.textPrimary),
      titleMedium: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w600, fontSize: 17, color: AppColorsLight.textPrimary),
      titleSmall: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w600, fontSize: 14, color: AppColorsLight.textPrimary),
      bodyLarge: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w400, fontSize: 16, color: AppColorsLight.textPrimary),
      bodyMedium: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w400, fontSize: 14, color: AppColorsLight.textSecondary),
      bodySmall: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w400, fontSize: 12.5, color: AppColorsLight.textTertiary),
      labelLarge: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700, fontSize: 13, letterSpacing: 0.02, color: AppColorsLight.textPrimary),
      labelMedium: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700, fontSize: 11.5, letterSpacing: 0.08, color: AppColorsLight.primaryForeground),
      labelSmall: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w600, fontSize: 11, letterSpacing: 0.1, color: AppColorsLight.textTertiary),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: _manrope,
      textTheme: textTheme,

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColorsLight.primary,
        brightness: Brightness.light,
        primary: AppColorsLight.primary,
        onPrimary: AppColorsLight.textPrimary,
        primaryContainer: AppColorsLight.primary,
        onPrimaryContainer: AppColorsLight.textPrimary,
        secondary: AppColorsLight.secondary,
        secondaryContainer: AppColorsLight.surface2,
        onSecondaryContainer: AppColorsLight.textPrimary,
        tertiary: AppColorsLight.primaryForeground,
        tertiaryContainer: AppColorsLight.surface2,
        onTertiaryContainer: AppColorsLight.textPrimary,
        surface: AppColorsLight.surface1,
        onSurface: AppColorsLight.textPrimary,
        error: AppColorsLight.error,
        onError: AppColorsLight.textPrimary,
      ),

      scaffoldBackgroundColor: AppColorsLight.base,

      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColorsLight.base,
        foregroundColor: AppColorsLight.textPrimary,
        titleTextStyle: TextStyle(
          fontFamily: _fraunces,
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: AppColorsLight.textPrimary,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorsLight.surface1,
        labelStyle: const TextStyle(fontFamily: _manrope, color: AppColorsLight.textSecondary),
        hintStyle: const TextStyle(fontFamily: _manrope, color: AppColorsLight.textTertiary),
        helperStyle: const TextStyle(fontFamily: _manrope, color: AppColorsLight.textTertiary),
        errorStyle: const TextStyle(fontFamily: _manrope, color: AppColorsLight.critical),
        prefixIconColor: AppColorsLight.textSecondary,
        suffixIconColor: AppColorsLight.textSecondary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColorsLight.hairline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColorsLight.hairline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColorsLight.primaryForeground,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColorsLight.critical,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColorsLight.critical,
            width: 2,
          ),
        ),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColorsLight.primaryForeground,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          backgroundColor: AppColorsLight.primary,
          foregroundColor: AppColorsLight.textPrimary,
          textStyle: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          backgroundColor: AppColorsLight.primary,
          foregroundColor: AppColorsLight.textPrimary,
          textStyle: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColorsLight.primaryForeground,
          side: const BorderSide(color: AppColorsLight.primaryForeground, width: 1.5),
          textStyle: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColorsLight.primaryForeground,
          textStyle: const TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: AppColorsLight.surface1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColorsLight.surface1,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColorsLight.primaryForeground,
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColorsLight.surface1,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AppColorsLight.hairline, width: 1),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColorsLight.hairline,
        thickness: 1,
        space: 1,
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppColorsLight.surface2,
        labelStyle: const TextStyle(fontFamily: _manrope, fontSize: 12.5, color: AppColorsLight.textPrimary),
        side: const BorderSide(color: AppColorsLight.hairline),
        shape: const StadiumBorder(),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColorsLight.surface1,
        indicatorColor: AppColorsLight.primary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontFamily: _manrope,
            fontSize: 11,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected ? AppColorsLight.textPrimary : AppColorsLight.textSecondary,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? AppColorsLight.textPrimary : AppColorsLight.textSecondary,
          );
        }),
      ),

      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? AppColorsLight.primary
                : AppColorsLight.surface1;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? AppColorsLight.textPrimary
                : AppColorsLight.textSecondary;
          }),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontFamily: _manrope, fontWeight: FontWeight.w600, fontSize: 13),
          ),
          side: const WidgetStatePropertyAll(
            BorderSide(color: AppColorsLight.hairline),
          ),
        ),
      ),

      extensions: const [PelavColors.light],
    );
  }
}
