import 'package:flutter/cupertino.dart';

abstract class LightThemeConstants {
  /// Core colors
  static const Color primary = Color(0xFF0660F2);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F7F8);
  static const Color text = Color(0xFF0F172A);
  static const Color danger = Color(0xFFef4444);
  static const Color glassBg = Color(0x0d3c83f6);
  static const Color glassBorder = Color(0x1A0660F2);

  /// Glassmorphism & Card colors
  static const Color cardBg = glassBg;
  static const Color cardBorder = glassBorder;

  /// Card Gradients
  static const LinearGradient cardPopularGradient = LinearGradient(
    colors: <Color>[primary, Color(0xFF60A5FA)],
    begin: .topLeft,
    end: .bottomRight
  );

  /// CTA
  static const LinearGradient ctaGradient = LinearGradient(
    colors: <Color>[Color(0x260660F2), Color(0x0D0660F2)],
    begin: .topLeft,
    end: .bottomRight
  );

  /// Input / Form colors
  static const Color inputBg = secondary;
  static const Color inputBorder = primary;

  /// Button colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = background;
}
