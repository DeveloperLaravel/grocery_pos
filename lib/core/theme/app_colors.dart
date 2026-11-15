
import 'package:flutter/material.dart';

/// =======================================================
/// Grocery POS - Design System
/// Centralized colors for Light & Dark themes.
/// =======================================================

abstract final class AppColors {
  const AppColors._();

  // =====================================================
  // 1. Brand Colors
  // =====================================================

  static const Color primary = Color(0xFF087F5B);
  static const Color primaryLight = Color(0xFF13A879);
  static const Color primaryDark = Color(0xFF075C43);

  static const Color secondary = Color(0xFF2B8C83);
  static const Color secondaryLight = Color(0xFF64B6A8);
  static const Color secondaryDark = Color(0xFF17665F);

  static const Color accent = Color(0xFFD6A84F);
  static const Color accentLight = Color(0xFFF0D38A);
  static const Color accentDark = Color(0xFFAA8130);

  // =====================================================
  // 2. Light Theme
  // =====================================================

  // Backgrounds
  static const Color lightBackground = Color(0xFFF5F8F6);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFEAF2ED);
  static const Color lightSurfaceElevated = Color(0xFFFFFFFF);

  // Text
  static const Color lightText = Color(0xFF18352B);
  static const Color lightSecondaryText = Color(0xFF718078);
  static const Color lightDisabledText = Color(0xFFAAB7AF);

  // Borders & Dividers
  static const Color lightBorder = Color(0xFFE3EBE6);
  static const Color lightDivider = Color(0xFFEDF1EE);

  // =====================================================
  // 3. Dark Theme
  // =====================================================

  // Backgrounds
  static const Color darkBackground = Color(0xFF101A16);
  static const Color darkSurface = Color(0xFF18251F);
  static const Color darkSurfaceVariant = Color(0xFF22342B);
  static const Color darkSurfaceElevated = Color(0xFF26382F);

  // Text
  static const Color darkText = Color(0xFFE8F2EC);
  static const Color darkSecondaryText = Color(0xFFA0B2A7);
  static const Color darkDisabledText = Color(0xFF64756B);

  // Borders & Dividers
  static const Color darkBorder = Color(0xFF30443A);
  static const Color darkDivider = Color(0xFF293B31);

  // =====================================================
  // 4. Status Colors
  // =====================================================

  // Success
  static const Color success = Color(0xFF159B68);
  static const Color successLight = Color(0xFFE5F5ED);
  static const Color successDark = Color(0xFF0D6847);

  // Warning
  static const Color warning = Color(0xFFE5A43B);
  static const Color warningLight = Color(0xFFFFF4DE);
  static const Color warningDark = Color(0xFF996313);

  // Error
  static const Color error = Color(0xFFD94F55);
  static const Color errorLight = Color(0xFFFCEBEC);
  static const Color errorDark = Color(0xFF9E3038);

  // Information
  static const Color info = Color(0xFF4285D4);
  static const Color infoLight = Color(0xFFEAF2FC);
  static const Color infoDark = Color(0xFF245A9C);

  // =====================================================
  // 5. Financial Colors
  // =====================================================

  static const Color profit = Color(0xFF159B68);
  static const Color loss = Color(0xFFD94F55);
  static const Color revenue = Color(0xFF087F5B);
  static const Color expense = Color(0xFFE5A43B);
  static const Color discount = Color(0xFF4285D4);
  static const Color debt = Color(0xFFD97736);

  // =====================================================
  // 6. Inventory Colors
  // =====================================================

  static const Color stockAvailable = Color(0xFF159B68);
  static const Color stockLow = Color(0xFFE5A43B);
  static const Color stockOut = Color(0xFFD94F55);
  static const Color stockReserved = Color(0xFF4285D4);

  // =====================================================
  // 7. Interactive States
  // =====================================================

  static const Color hover = Color(0x14087F5B);
  static const Color pressed = Color(0x26087F5B);
  static const Color focus = Color(0xFF13A879);
  static const Color selection = Color(0x1F087F5B);

  // =====================================================
  // 8. Common Colors
  // =====================================================

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  static const Color overlay = Color(0x80000000);
}
