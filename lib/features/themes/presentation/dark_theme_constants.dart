import 'package:flutter/cupertino.dart';

abstract class DarkThemeConstants {
  /// Core colors
  static const Color primary = Color(0xFF25F4F4);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color background = Color(0xFF102222);
  static const Color text = Color(0xFFF1F5F9);
  static const Color danger = Color(0xFFef4444);
  static const Color glassBg = Color(0x0D25F4F4);
  static const Color glassBorder = Color(0x1A25F4F4);

  /// Glassmorphism & Card colors
  static const Color cardBg = glassBg;
  static const Color cardBorder = glassBorder;

  /// Card Gradients
  static const LinearGradient cardGradient = LinearGradient(
    colors: <Color>[primary, Color(0xFF20E0E0)],
    begin: .topLeft,
    end: .bottomRight,
  );

  /// CTA
  static const LinearGradient ctaGradient = LinearGradient(
    colors: <Color>[Color(0x2625F4F4), glassBg],
    begin: .topLeft,
    end: .bottomRight,
  );

  /// Input / Form colors
  static const Color inputBg = glassBg;
  static const Color inputBorder = glassBorder;

  /// Button colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = background;
}
