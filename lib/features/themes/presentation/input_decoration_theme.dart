import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/cupertino.dart';

const Color kInputBgColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.inputBg,
  darkColor: DarkThemeConstants.inputBg
);

const Color kInputBorderColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.inputBorder,
  darkColor: DarkThemeConstants.inputBorder
);

final BoxDecoration kCupertinoInputDecoration = BoxDecoration(
  color: kInputBgColor,
  border: Border.all(color: kInputBorderColor),
  borderRadius: const BorderRadius.all(.circular(8))
);
