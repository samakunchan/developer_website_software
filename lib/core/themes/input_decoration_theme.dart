import 'package:developer_website_software/core/themes/dark_theme_constants.dart';
import 'package:developer_website_software/core/themes/light_theme_constants.dart';
import 'package:flutter/cupertino.dart';

const Color kInputBgColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.inputBg,
  darkColor: DarkThemeConstants.inputBg,
);

const Color kInputBorderColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.inputBorder,
  darkColor: DarkThemeConstants.inputBorder,
);

final BoxDecoration kCupertinoInputDecoration = BoxDecoration(
  color: kInputBgColor,
  border: Border.all(
    color: kInputBorderColor,
  ),
  borderRadius: const BorderRadius.all(Radius.circular(8)),
);
