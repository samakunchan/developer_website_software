import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/cupertino.dart';

const Color kButtonPrimaryColor = kPrimaryColor;

const Color kButtonSecondaryColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.buttonSecondary,
  darkColor: DarkThemeConstants.buttonSecondary
);

const double kButtonBorderRadius = 8;

const EdgeInsets kButtonPadding = .symmetric(horizontal: 24, vertical: 12);
