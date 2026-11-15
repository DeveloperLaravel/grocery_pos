import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppSettingsController extends ChangeNotifier {
  AppSettingsController(this._preferences) {
    _loadFromPreferences();
  }

  final SharedPreferences _preferences;

  static const String _themeKey = 'app_theme_mode';
  static const String _compactModeKey = 'compact_mode';
  static const String _confirmBeforeSaleKey = 'confirm_before_sale';

  static const ThemeMode _defaultThemeMode = ThemeMode.system;
  static const bool _defaultCompactMode = false;
  static const bool _defaultConfirmBeforeSale = true;

  late ThemeMode _themeMode;
  late bool _compactMode;
  late bool _confirmBeforeSale;

  bool _isSaving = false;

  ThemeMode get themeMode => _themeMode;
  bool get compactMode => _compactMode;
  bool get confirmBeforeSale => _confirmBeforeSale;
  bool get isSaving => _isSaving;

  void _loadFromPreferences() {
    final savedTheme = _preferences.getString(_themeKey);

    _themeMode = ThemeMode.values.firstWhere(
      (mode) => mode.name == savedTheme,
      orElse: () => _defaultThemeMode,
    );

    _compactMode =
        _preferences.getBool(_compactModeKey) ?? _defaultCompactMode;

    _confirmBeforeSale =
        _preferences.getBool(_confirmBeforeSaleKey) ??
            _defaultConfirmBeforeSale;
  }

  Future<void> _save(Future<bool> Function() action) async {
    if (_isSaving) {
      throw StateError('Another settings operation is already in progress.');
    }

    _isSaving = true;
    notifyListeners();

    try {
      final success = await action();

      if (!success) {
        throw Exception('Failed to save application settings.');
      }
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  Future<void> setThemeMode(ThemeMode value) async {
    if (_themeMode == value) return;

    final previous = _themeMode;

    _themeMode = value;
    notifyListeners();

    try {
      await _save(
        () => _preferences.setString(_themeKey, value.name),
      );
    } catch (_) {
      _themeMode = previous;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> setCompactMode(bool value) async {
    if (_compactMode == value) return;

    final previous = _compactMode;

    _compactMode = value;
    notifyListeners();

    try {
      await _save(
        () => _preferences.setBool(_compactModeKey, value),
      );
    } catch (_) {
      _compactMode = previous;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> setConfirmBeforeSale(bool value) async {
    if (_confirmBeforeSale == value) return;

    final previous = _confirmBeforeSale;

    _confirmBeforeSale = value;
    notifyListeners();

    try {
      await _save(
        () => _preferences.setBool(_confirmBeforeSaleKey, value),
      );
    } catch (_) {
      _confirmBeforeSale = previous;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> resetDefaults() async {
    final oldTheme = _themeMode;
    final oldCompact = _compactMode;
    final oldConfirm = _confirmBeforeSale;

    _themeMode = _defaultThemeMode;
    _compactMode = _defaultCompactMode;
    _confirmBeforeSale = _defaultConfirmBeforeSale;

    notifyListeners();

    try {
      await _save(() async {
        final results = await Future.wait([
          _preferences.setString(
            _themeKey,
            _defaultThemeMode.name,
          ),
          _preferences.setBool(
            _compactModeKey,
            _defaultCompactMode,
          ),
          _preferences.setBool(
            _confirmBeforeSaleKey,
            _defaultConfirmBeforeSale,
          ),
        ]);

        return results.every((success) => success);
      });
    } catch (_) {
      _themeMode = oldTheme;
      _compactMode = oldCompact;
      _confirmBeforeSale = oldConfirm;

      notifyListeners();
      rethrow;
    }
  }
}