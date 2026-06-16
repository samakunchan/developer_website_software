import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/text_theme.dart';
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
    selectionHandleColor: kPrimaryColor
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
      onSurface: LightThemeConstants.text
    )
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
      onSurface: DarkThemeConstants.text
    )
  );

  /// Fluent Themes (Windows)
  static final fluent.FluentThemeData fluentLightTheme = fluent.FluentThemeData(
    brightness: .light,
    accentColor: fluent.AccentColor.swatch(const {'normal': LightThemeConstants.primary}),
    scaffoldBackgroundColor: LightThemeConstants.background
  );

  static final fluent.FluentThemeData fluentDarkTheme = fluent.FluentThemeData(
    brightness: .dark,
    accentColor: fluent.AccentColor.swatch(const {'normal': DarkThemeConstants.primary}),
    scaffoldBackgroundColor: DarkThemeConstants.background
  );

  /// Dynamic Cupertino Theme Data generator
  /// This method is useful, because it updates dynamically the app by opening the menu CMD + ",".
  static CupertinoThemeData getCupertinoTheme(Brightness brightness, String fontFamily, double fontSizeMultiplier) {
    final String? resolvedFontFamily = fontFamily == 'System' ? null : fontFamily;
    final bool isDark = brightness == .dark;

    return CupertinoThemeData(
      brightness: brightness,
      primaryColor: kPrimaryColor,
      primaryContrastingColor: kTextContrastColor,
      barBackgroundColor: isDark ? const Color(0xFF1E1E1E) : kSecondaryBackgroundColor,
      scaffoldBackgroundColor: isDark ? const Color(0xFF121212) : kBackgroundColor,
      selectionHandleColor: kPrimaryColor,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(
          fontFamily: resolvedFontFamily,
          color: isDark ? CupertinoColors.white : kTextColor,
          fontSize: 16 * fontSizeMultiplier
        ),
        navTitleTextStyle: TextStyle(
          fontFamily: resolvedFontFamily,
          color: isDark ? CupertinoColors.white : kTextColor,
          fontSize: 18 * fontSizeMultiplier,
          fontWeight: .bold
        ),
        navLargeTitleTextStyle: TextStyle(
          fontFamily: resolvedFontFamily,
          color: isDark ? CupertinoColors.white : kTextColor,
          fontSize: 34 * fontSizeMultiplier,
          fontWeight: .bold
        ),
        actionTextStyle: TextStyle(
          fontFamily: resolvedFontFamily,
          color: kSidebarLinkColor,
          fontSize: 16 * fontSizeMultiplier,
          fontWeight: .w500
        ),
        actionSmallTextStyle: TextStyle(
          fontFamily: resolvedFontFamily,
          color: kSidebarLinkColor,
          fontSize: 14 * fontSizeMultiplier,
          fontWeight: .w500
        )
      )
    );
  }

  /// Dynamic Material Theme Data generator
  static material.ThemeData getMaterialTheme(Brightness brightness, String fontFamily, double fontSizeMultiplier) {
    final String? resolvedFontFamily = fontFamily == 'System' ? null : fontFamily;
    final bool isDark = brightness == .dark;
    final material.ThemeData baseTheme = isDark ? materialDarkTheme : materialLightTheme;

    return baseTheme.copyWith(
      textTheme: baseTheme.textTheme.apply(fontFamily: resolvedFontFamily, fontSizeFactor: fontSizeMultiplier)
    );
  }

  /// Dynamic Fluent Theme Data generator
  static fluent.FluentThemeData getFluentTheme(Brightness brightness, String fontFamily, double fontSizeMultiplier) {
    final bool isDark = brightness == .dark;
    final fluent.FluentThemeData baseTheme = isDark ? fluentDarkTheme : fluentLightTheme;

    return baseTheme.copyWith(
      // Fluent UI doesn't have an easy textTheme.apply, but custom configurations can be added if needed
    );
  }
}
