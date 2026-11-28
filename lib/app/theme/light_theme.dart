
import 'package:flutter/material.dart';

import 'app_colors.dart';

class LightTheme {
  const LightTheme._();

  static ThemeData get theme {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,

      primary: AppColors.primary,
      onPrimary: Colors.white,

      secondary: AppColors.secondary,
      onSecondary: Colors.white,

      error: AppColors.error,
      onError: Colors.white,

      surface: AppColors.lightSurface,
      onSurface: AppColors.lightText,

      surfaceContainerHighest: AppColors.lightSurfaceVariant,
      onSurfaceVariant: AppColors.lightSecondaryText,

      outline: AppColors.lightBorder,
      outlineVariant: Color(0xFFD5E2DA),

      shadow: Colors.black,
      scrim: Colors.black54,

      inverseSurface: Color(0xFF263B31),
      onInverseSurface: Colors.white,
      inversePrimary: Color(0xFF8AD9B7),

      primaryContainer: Color(0xFFD5F2E4),
      onPrimaryContainer: Color(0xFF064D36),

      secondaryContainer: Color(0xFFD5EEEA),
      onSecondaryContainer: Color(0xFF124D47),

      tertiary: AppColors.accent,
      onTertiary: Color(0xFF332300),

      tertiaryContainer: Color(0xFFFFEDC7),
      onTertiaryContainer: Color(0xFF4D3700),

      errorContainer: Color(0xFFFFDAD9),
      onErrorContainer: Color(0xFF690005),

      surfaceContainerLowest: Colors.white,
      surfaceContainerLow: Color(0xFFF8FAF8),
      surfaceContainer: Color(0xFFF1F5F2),
      surfaceContainerHigh: Color(0xFFEAF0EC),

    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,

      fontFamily: 'Cairo',

      scaffoldBackgroundColor: AppColors.lightBackground,

      visualDensity: VisualDensity.standard,

      // ======================================
      // AppBar
      // ======================================

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightText,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: AppColors.lightText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
      ),

      // ======================================
      // Cards
      // ======================================

      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(
            color: AppColors.lightBorder,
            width: 1,
          ),
        ),
      ),

      // ======================================
      // Inputs
      // ======================================

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: const TextStyle(
          color: AppColors.lightSecondaryText,
          fontSize: 13,
        ),
        labelStyle: const TextStyle(
          color: AppColors.lightSecondaryText,
        ),
        prefixIconColor: AppColors.lightSecondaryText,
        suffixIconColor: AppColors.lightSecondaryText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.lightBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.lightBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
      ),

      // ======================================
      // Elevated Buttons
      // ======================================

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ======================================
      // Filled Buttons
      // ======================================

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ======================================
      // Outlined Buttons
      // ======================================

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(
            color: AppColors.lightBorder,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),

      // ======================================
      // Text Buttons
      // ======================================

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ======================================
      // Navigation Bar
      // ======================================

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        elevation: 0,
        indicatorColor: const Color(0xFFDDF3E8),
        height: 72,
        labelBehavior:
            NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
              color: AppColors.primary,
              size: 24,
            );
          }

          return const IconThemeData(
            color: AppColors.lightSecondaryText,
            size: 22,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            fontFamily: 'Cairo',
            fontSize: 11,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.bold
                : FontWeight.normal,
            color: states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.lightSecondaryText,
          );
        }),
      ),

      // ======================================
      // Dialog
      // ======================================

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.lightSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: const TextStyle(
          color: AppColors.lightText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        contentTextStyle: const TextStyle(
          color: AppColors.lightSecondaryText,
          fontSize: 14,
          fontFamily: 'Cairo',
        ),
      ),

      // ======================================
      // List Tiles
      // ======================================

      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.primary,
        textColor: AppColors.lightText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
      ),

      // ======================================
      // Divider
      // ======================================

      dividerTheme: const DividerThemeData(
        color: AppColors.lightBorder,
        thickness: 1,
        space: 1,
      ),

      // ======================================
      // SnackBar
      // ======================================

      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF263B31),
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Cairo',
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),

      // ======================================
      // Chip
      // ======================================

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightSurfaceVariant,
        selectedColor: const Color(0xFFD5F2E4),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: const TextStyle(
          color: AppColors.lightText,
          fontFamily: 'Cairo',
        ),
      ),

      // ======================================
      // Progress
      // ======================================

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.lightSurfaceVariant,
      ),

      // ======================================
      // Switch
      // ======================================

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? Colors.white
              : AppColors.lightSecondaryText;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.lightSurfaceVariant;
        }),
      ),

      // ======================================
      // Floating Action Button
      // ======================================

      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),

      // ======================================
      // Data Tables
      // ======================================

      dataTableTheme: const DataTableThemeData(
        headingRowColor: WidgetStatePropertyAll(
          AppColors.lightSurfaceVariant,
        ),
        headingTextStyle: TextStyle(
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        dataTextStyle: TextStyle(
          color: AppColors.lightText,
          fontFamily: 'Cairo',
        ),
        dividerThickness: 0.7,
      ),
    );
  }
}
