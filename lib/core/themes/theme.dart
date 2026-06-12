import 'package:developer_website_software/core/themes/constantes.dart';
import 'package:developer_website_software/core/themes/dark_theme_constants.dart';
import 'package:developer_website_software/core/themes/light_theme_constants.dart';
import 'package:developer_website_software/core/themes/text_theme.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class AppTheme {
  /// Cupertino Theme
  static const CupertinoThemeData cupertinoThemeData = CupertinoThemeData(
    primaryColor: kPrimaryColor,
    primaryContrastingColor: kTextContrastColor,
    textTheme: kCupertinoTextTheme,
    barBackgroundColor: kSecondaryBackgroundColor,
    scaffoldBackgroundColor: kBackgroundColor,
    selectionHandleColor: kPrimaryColor,
  );

  /// Material Themes
  static final material.ThemeData materialLightTheme = material.ThemeData(
    brightness: .light,
    primaryColor: LightThemeConstants.primary,
    scaffoldBackgroundColor: LightThemeConstants.background,
    fontFamily: kFontFamily,
    colorScheme: const material.ColorScheme.light(
      primary: LightThemeConstants.primary,
      secondary: LightThemeConstants.secondary,
      surface: LightThemeConstants.background,
      onSurface: LightThemeConstants.text,
    ),
  );

  static final material.ThemeData materialDarkTheme = material.ThemeData(
    brightness: .dark,
    primaryColor: DarkThemeConstants.primary,
    scaffoldBackgroundColor: DarkThemeConstants.background,
    fontFamily: kFontFamily,
    colorScheme: const material.ColorScheme.dark(
      primary: DarkThemeConstants.primary,
      secondary: DarkThemeConstants.secondary,
      surface: DarkThemeConstants.background,
      onSurface: DarkThemeConstants.text,
    ),
  );

  /// Fluent Themes (Windows)
  static final fluent.FluentThemeData fluentLightTheme = fluent.FluentThemeData(
    brightness: .light,
    accentColor: fluent.AccentColor.swatch(const {
      'normal': LightThemeConstants.primary,
    }),
    scaffoldBackgroundColor: LightThemeConstants.background,
  );

  static final fluent.FluentThemeData fluentDarkTheme = fluent.FluentThemeData(
    brightness: .dark,
    accentColor: fluent.AccentColor.swatch(const {
      'normal': DarkThemeConstants.primary,
    }),
    scaffoldBackgroundColor: DarkThemeConstants.background,
  );
}
