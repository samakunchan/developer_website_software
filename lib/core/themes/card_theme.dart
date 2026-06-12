import 'package:developer_website_software/core/themes/dark_theme_constants.dart';
import 'package:developer_website_software/core/themes/light_theme_constants.dart';
import 'package:flutter/cupertino.dart';

const Color kCardBgColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.cardBg,
  darkColor: DarkThemeConstants.cardBg,
);

const Color kCardBorderColor = CupertinoDynamicColor.withBrightness(
  color: LightThemeConstants.cardBorder,
  darkColor: DarkThemeConstants.cardBorder,
);

final BoxDecoration kCupertinoCardDecoration = BoxDecoration(
  color: kCardBgColor,
  border: Border.all(
    color: kCardBorderColor,
  ),
  borderRadius: const BorderRadius.all(Radius.circular(12)),
);

// Dynamic card and CTA gradients using CupertinoDynamicColor
const LinearGradient kCardPopularGradient = LinearGradient(
  colors: <Color>[
    CupertinoDynamicColor.withBrightness(
      color: LightThemeConstants.primary,
      darkColor: DarkThemeConstants.primary,
    ),
    CupertinoDynamicColor.withBrightness(
      color: Color(0xFF60A5FA),
      darkColor: Color(0xFF20E0E0),
    ),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const LinearGradient kCtaGradient = LinearGradient(
  colors: <Color>[
    CupertinoDynamicColor.withBrightness(
      color: Color(0x260660F2),
      darkColor: Color(0x2625F4F4),
    ),
    CupertinoDynamicColor.withBrightness(
      color: Color(0x0D0660F2),
      darkColor: Color(0x0D25F4F4),
    ),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
