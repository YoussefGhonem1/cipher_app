import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primaryContainer,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
      ),
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Bebas Neue',
          fontSize: 84,
          fontWeight: FontWeight.w400,
          height: 80 / 84,
          letterSpacing: 0.05,
          color: AppColors.onSurface,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Bebas Neue',
          fontSize: 48,
          fontWeight: FontWeight.w400,
          height: 48 / 48,
          letterSpacing: 0.02,
          color: AppColors.onSurface,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Bebas Neue',
          fontSize: 32,
          fontWeight: FontWeight.w400,
          height: 32 / 32,
          letterSpacing: 0.02,
          color: AppColors.onSurface,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Bebas Neue',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          height: 20 / 20,
          letterSpacing: 0.05,
          color: AppColors.onSurface,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 28 / 18,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 24 / 16,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 12,
          fontWeight: FontWeight.w700,
          height: 16 / 12,
          letterSpacing: 0.1,
          color: AppColors.onSurface,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Courier Prime',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 20 / 14,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryContainer,
          foregroundColor: AppColors.pitchBlack,
          disabledBackgroundColor: AppColors.surfaceContainerHighest,
          disabledForegroundColor: AppColors.outline,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: const TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.05,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.metallicSilver, width: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: const TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.05,
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.deepCharcoal,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.metallicSilver, width: 1),
          borderRadius: BorderRadius.zero,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.metallicSilver, width: 1),
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.neonAmber, width: 1.5),
          borderRadius: BorderRadius.zero,
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.crimsonRed, width: 1),
          borderRadius: BorderRadius.zero,
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.crimsonRed, width: 1.5),
          borderRadius: BorderRadius.zero,
        ),
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          color: AppColors.outline,
        ),
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          color: AppColors.onSurfaceVariant,
        ),
      ),
      cardTheme: const CardTheme(
        color: AppColors.deepCharcoal,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: AppColors.metallicSilver, width: 0.2),
        ),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.metallicSilver,
        thickness: 1,
        space: 1,
      ),
    );
  }
}