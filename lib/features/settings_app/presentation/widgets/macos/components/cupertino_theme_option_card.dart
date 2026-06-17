import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/macos/components/cupertino_theme_card_label.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/macos/components/cupertino_theme_color_preview.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';

class CupertinoThemeOptionCard extends StatelessWidget {
  const CupertinoThemeOptionCard({
    required this.option,
    required this.isActive,
    required this.isLoading,
    required this.onTap,
    super.key,
  });

  final ThemeOption option;
  final bool isActive;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: isDark ? kCardDarkBgColor : CupertinoColors.systemBackground,
          borderRadius: .circular(12),
          border: .all(
            color: isActive
                ? CupertinoTheme.of(context).primaryColor
                : (isDark ? CupertinoColors.systemGrey6 : CupertinoColors.systemGrey5),
            width: isActive ? 2 : 1,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: CupertinoTheme.of(context).primaryColor.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            CupertinoThemeColorPreview(primaryColor: option.primaryColor, secondaryColor: option.secondaryColor),
            CupertinoThemeCardLabel(name: option.name, isActive: isActive),
          ],
        ),
      ),
    );
  }
}
