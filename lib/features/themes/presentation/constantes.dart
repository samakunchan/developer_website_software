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

const Color kScaffoldBackgroundColor = Color(0xFF121212);
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

// Theme Options Preview Colors
const Color kDarkPrimaryColor = Color(0xFF25F4F4);
const Color kDarkSecondaryColor = Color(0xFF102222);

const Color kLightPrimaryColor = Color(0xFF0660F2);
const Color kLightSecondaryColor = Color(0xFFFFFFFF);

const Color kForestPrimaryColor = Color(0xFF006D36);
const Color kForestSecondaryColor = Color(0xFFF8F8F8);

const Color kOceanPrimaryColor = Color(0xFF0B1326);
const Color kOceanSecondaryColor = Color(0xFF8ED5FF);

const Color kDesertPrimaryColor = Color(0xFF974225);
const Color kDesertSecondaryColor = Color(0xFFFCF9F4);

const Color kGuardianPrimaryColor = Color(0xFFE01A4F);
const Color kGuardianSecondaryColor = Color(0xFF1D1E2C);

const Color kAegisPrimaryColor = Color(0xFFF15152);
const Color kAegisSecondaryColor = Color(0xFF3C3744);
