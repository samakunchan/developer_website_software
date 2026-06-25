import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum AppFontSize {
  small(value: 'small'),
  medium(value: 'medium'),
  large(value: 'large');

  const AppFontSize({required this.value});
  final String value;

  double get multiplier {
    switch (this) {
      case AppFontSize.small:
        return 0.85;
      case AppFontSize.medium:
        return 1;
      case AppFontSize.large:
        return 1.25;
    }
  }
}

enum AppFontFamily {
  system(value: 'System'),
  inter(value: 'Inter');

  const AppFontFamily({required this.value});
  final String value;
}

class SettingsSoftSignals {
  SettingsSoftSignals(this._prefs) {
    _loadSettings();
  }
  final SharedPreferences _prefs;

  static const String _themeKey = 'local_theme_mode';
  static const String _fontSizeKey = 'local_font_size';
  static const String _fontFamilyKey = 'local_font_family';
  static const String _languageKey = 'local_language';

  final Signal<ThemeMode> themeMode = signal<ThemeMode>(ThemeMode.system);
  final Signal<AppFontSize> fontSize = signal<AppFontSize>(AppFontSize.medium);
  final Signal<AppFontFamily> fontFamily = signal<AppFontFamily>(AppFontFamily.system);
  final Signal<String> localeCode = signal<String>('system');

  void _loadSettings() {
    final String? savedTheme = _prefs.getString(_themeKey);
    if (savedTheme != null) {
      themeMode.value = ThemeMode.values.firstWhere((ThemeMode e) => e.name == savedTheme, orElse: () => ThemeMode.system);
    }

    final String? savedFontSize = _prefs.getString(_fontSizeKey);
    if (savedFontSize != null) {
      fontSize.value = AppFontSize.values.firstWhere(
        (AppFontSize e) => e.name == savedFontSize,
        orElse: () => AppFontSize.medium
      );
    }

    final String? savedFontFamily = _prefs.getString(_fontFamilyKey);
    if (savedFontFamily != null) {
      fontFamily.value = AppFontFamily.values.firstWhere(
        (AppFontFamily e) => e.name == savedFontFamily,
        orElse: () => AppFontFamily.system
      );
    }

    final String? savedLanguage = _prefs.getString(_languageKey);
    if (savedLanguage != null) {
      localeCode.value = savedLanguage;
    }
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    unawaited(_prefs.setString(_themeKey, mode.name));
  }

  void setFontSize(AppFontSize size) {
    fontSize.value = size;
    unawaited(_prefs.setString(_fontSizeKey, size.name));
  }

  void setFontFamily(AppFontFamily family) {
    fontFamily.value = family;
    unawaited(_prefs.setString(_fontFamilyKey, family.name));
  }

  void setLocaleCode(String code) {
    localeCode.value = code;
    unawaited(_prefs.setString(_languageKey, code));
  }
}
