import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/cupertino.dart';

const String kFontFamily = 'Inter';
const double kDefaultSpacing = 16;

/// Dynamic color mappings using CupertinoDynamicColor
const Color kPrimaryColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.primary,
  darkColor: DarkThemeConstants.primary,
);

const Color kBackgroundColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.background,
  darkColor: DarkThemeConstants.background,
);

const Color kSecondaryBackgroundColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.secondary,
  darkColor: DarkThemeConstants.background,
);

const Color kTextColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.text,
  darkColor: DarkThemeConstants.text,
);

const Color kTextContrastColor = CupertinoDynamicColor.withBrightness(
  color: DarkThemeConstants.text,
  darkColor: LightThemeConstants.text,
);

const Color kGlassBgColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.glassBg,
  darkColor: DarkThemeConstants.glassBg,
);

const Color kGlassBorderColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.glassBorder,
  darkColor: DarkThemeConstants.glassBorder,
);

const Color kDangerColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.danger,
  darkColor: DarkThemeConstants.danger,
);

const Color kSuccessColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.danger,
  darkColor: DarkThemeConstants.danger,
);

const Color kShadowColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.glassBg,
  darkColor: DarkThemeConstants.primary,
);

const Color kCardDarkBgColor = Color(0xFF1C1C1E);
const Color kCardSecondaryDarkBgColor = Color(0xFF2C2C2E);

const Color kSidebarLinkColor = Color(0xFF94A3B8);

const Color kSidebarBackgroundColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.glassBg,
  darkColor: DarkThemeConstants.background,
);

const Color kSidebarBorderColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.glassBorder,
  darkColor: Color(0xFF1E293B),
);
