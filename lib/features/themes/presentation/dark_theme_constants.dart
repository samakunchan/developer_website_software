import 'package:flutter/cupertino.dart';

abstract class DarkThemeConstants {
  // Core colors
  static const Color primary = Color(0xFF25F4F4);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color background = Color(0xFF102222);
  static const Color text = Color(0xFFF1F5F9);
  static const Color danger = Color(0xFFef4444);

  // Glassmorphism & Card colors
  static const Color glassBg = Color(0x0D25F4F4); // rgba(37, 244, 244, 0.05)
  static const Color glassBorder = Color(0x1A25F4F4); // rgba(37, 244, 244, 0.1)
  static const Color cardBg = Color(0x0D25F4F4); // rgba(37, 244, 244, 0.05)
  static const Color cardBorder = Color(0x1A25F4F4); // rgba(37, 244, 244, 0.1)

  // Card Gradients
  static const LinearGradient cardGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF25F4F4),
      Color(0xFF20E0E0),
    ],
    begin: .topLeft,
    end: .bottomRight,
  );

  static const LinearGradient ctaGradient = LinearGradient(
    colors: <Color>[
      Color(0x2625F4F4), // rgba(37, 244, 244, 0.15)
      Color(0x0D25F4F4), // rgba(37, 244, 244, 0.05)
    ],
    begin: .topLeft,
    end: .bottomRight,
  );

  // Input / Form colors
  static const Color inputBg = Color(0x0D25F4F4); // rgba(37, 244, 244, 0.05)
  static const Color inputBorder = Color(0x1A25F4F4); // rgba(37, 244, 244, 0.1)

  // Button colors
  static const Color buttonPrimary = Color(0xFF25F4F4);
  static const Color buttonSecondary = Color(0xFF1E293B); // --color-slate-800
}
