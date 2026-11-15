
import 'package:flutter/material.dart';

import 'app_colors.dart';

class DarkTheme {
  const DarkTheme._();

  static ThemeData get theme {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,

      primary: Color(0xFF43C99A),
      onPrimary: Color(0xFF003826),

      secondary: Color(0xFF72CFC2),
      onSecondary: Color(0xFF003731),

      error: Color(0xFFFF7777),
      onError: Color(0xFF5F0000),

      surface: AppColors.darkSurface,
      onSurface: AppColors.darkText,

      surfaceContainerHighest: AppColors.darkSurfaceVariant,
      onSurfaceVariant: AppColors.darkSecondaryText,

      outline: AppColors.darkBorder,
      outlineVariant: Color(0xFF3D5548),

      shadow: Colors.black,
      scrim: Colors.black87,

      inverseSurface: Color(0xFFE8F2EC),
      onInverseSurface: Color(0xFF18251F),
      inversePrimary: AppColors.primary,

      primaryContainer: Color(0xFF075C43),
      onPrimaryContainer: Color(0xFFB5F1D5),

      secondaryContainer: Color(0xFF164E48),
      onSecondaryContainer: Color(0xFFC0F1E9),

      tertiary: Color(0xFFF2C66D),
      onTertiary: Color(0xFF422C00),

      tertiaryContainer: Color(0xFF5B4517),
      onTertiaryContainer: Color(0xFFFFE7B1),

      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),

      surfaceContainerLowest: Color(0xFF0B1410),
      surfaceContainerLow: Color(0xFF141F19),
      surfaceContainer: Color(0xFF1B2922),
      surfaceContainerHigh: Color(0xFF22342B),

    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,

      fontFamily: 'Cairo',

      scaffoldBackgroundColor: AppColors.darkBackground,

      visualDensity: VisualDensity.standard,

      // ======================================
      // AppBar
      // ======================================

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: AppColors.darkText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
      ),

      // ======================================
      // Cards
      // ======================================

      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(
            color: AppColors.darkBorder,
            width: 1,
          ),
        ),
      ),

      // ======================================
      // Inputs
      // ======================================

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurfaceVariant,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: const TextStyle(
          color: AppColors.darkSecondaryText,
          fontSize: 13,
        ),
        labelStyle: const TextStyle(
          color: AppColors.darkSecondaryText,
        ),
        prefixIconColor: AppColors.darkSecondaryText,
        suffixIconColor: AppColors.darkSecondaryText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.darkBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.darkBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFF43C99A),
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
      // Buttons
      // ======================================

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF43C99A),
          foregroundColor: const Color(0xFF003826),
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

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF43C99A),
          foregroundColor: const Color(0xFF003826),
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

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF43C99A),
          side: const BorderSide(
            color: AppColors.darkBorder,
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

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF43C99A),
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
        backgroundColor: AppColors.darkSurface,
        elevation: 0,
        indicatorColor: const Color(0xFF244D3C),
        height: 72,
        labelBehavior:
            NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
              color: Color(0xFF43C99A),
              size: 24,
            );
          }

          return const IconThemeData(
            color: AppColors.darkSecondaryText,
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
                ? const Color(0xFF43C99A)
                : AppColors.darkSecondaryText,
          );
        }),
      ),

      // ======================================
      // Dialog
      // ======================================

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: const TextStyle(
          color: AppColors.darkText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        contentTextStyle: const TextStyle(
          color: AppColors.darkSecondaryText,
          fontSize: 14,
          fontFamily: 'Cairo',
        ),
      ),

      // ======================================
      // List Tiles
      // ======================================

      listTileTheme: const ListTileThemeData(
        iconColor: Color(0xFF43C99A),
        textColor: AppColors.darkText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
      ),

      // ======================================
      // Divider
      // ======================================

      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorder,
        thickness: 1,
        space: 1,
      ),

      // ======================================
      // SnackBar
      // ======================================

      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF2C4337),
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
        backgroundColor: AppColors.darkSurfaceVariant,
        selectedColor: const Color(0xFF244D3C),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: const TextStyle(
          color: AppColors.darkText,
          fontFamily: 'Cairo',
        ),
      ),

      // ======================================
      // Progress
      // ======================================

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFF43C99A),
        linearTrackColor: AppColors.darkSurfaceVariant,
      ),

      // ======================================
      // Switch
      // ======================================

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? AppColors.darkBackground
              : AppColors.darkSecondaryText;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? const Color(0xFF43C99A)
              : AppColors.darkSurfaceVariant;
        }),
      ),

      // ======================================
      // Floating Action Button
      // ======================================

      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF43C99A),
        foregroundColor: Color(0xFF003826),
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
          AppColors.darkSurfaceVariant,
        ),
        headingTextStyle: TextStyle(
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        dataTextStyle: TextStyle(
          color: AppColors.darkText,
          fontFamily: 'Cairo',
        ),
        dividerThickness: 0.7,
      ),
    );
  }
}
