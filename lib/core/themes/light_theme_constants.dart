import 'package:flutter/cupertino.dart';

abstract class LightThemeConstants {
  // Core colors
  static const Color primary = Color(0xFF0660F2);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F7F8);
  static const Color text = Color(0xFF0F172A);
  static const Color danger = Color(0xFFef4444);

  // Glassmorphism & Card colors
  static const Color glassBg = Color(0x0D0660F2); // rgba(60, 131, 246, 0.05)
  static const Color glassBorder = Color(0x1A0660F2); // rgba(60, 131, 246, 0.1)
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0x1A0660F2); // rgba(60, 131, 246, 0.1)

  // Card Gradients
  static const LinearGradient cardPopularGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF0660F2),
      Color(0xFF60A5FA),
    ],
    begin: .topLeft,
    end: .bottomRight,
  );

  static const LinearGradient ctaGradient = LinearGradient(
    colors: <Color>[
      Color(0x260660F2), // rgba(60, 131, 246, 0.15)
      Color(0x0D0660F2), // rgba(60, 131, 246, 0.05)
    ],
    begin: .topLeft,
    end: .bottomRight,
  );

  // Input / Form colors
  static const Color inputBg = Color(0xFFFFFFFF);
  static const Color inputBorder = Color(0xFF0660F2);

  // Button colors
  static const Color buttonPrimary = Color(0xFF0660F2);
  static const Color buttonSecondary = Color(0xFFFFFFFF);
}
