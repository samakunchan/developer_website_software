import 'package:developer_website_software/core/themes/constantes.dart';
import 'package:developer_website_software/core/themes/dark_theme_constants.dart';
import 'package:developer_website_software/core/themes/light_theme_constants.dart';
import 'package:flutter/cupertino.dart';

const Color kButtonPrimaryColor = kPrimaryColor;

const Color kButtonSecondaryColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.buttonSecondary,
  darkColor: DarkThemeConstants.buttonSecondary,
);

const double kButtonBorderRadius = 8;

const EdgeInsets kButtonPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 12);
