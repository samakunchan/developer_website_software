import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/viewmodels/theme_view_model.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/macos/components/cupertino_theme_card_label.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/macos/components/cupertino_theme_color_preview.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoThemeOptionCard extends StatelessWidget {
  const CupertinoThemeOptionCard({
    required this.option,
    required this.currentThemeSignal,
    required this.isLoadingSignal,
    required this.onTap,
    super.key,
  });

  final ThemeOption option;
  final Signal<ThemeViewModel> currentThemeSignal;
  final Signal<bool> isLoadingSignal;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return SignalBuilder(
      builder: (_) {
        final bool isActive = currentThemeSignal.value.theme.value == option.id;
        final bool isLoading = isLoadingSignal.value;

        return GestureDetector(
          onTap: isLoading ? null : onTap,
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: isDark ? kCardDarkBgColor : CupertinoColors.systemBackground,
              borderRadius: .circular(12),
              border: .all(
                color: isActive
                    ? CupertinoTheme.of(context).primaryColor.withValues(alpha: .3)
                    : (isDark ? CupertinoColors.systemGrey6 : CupertinoColors.systemGrey5),
                width: 4,
              ),
            ),
            child: Padding(
              padding: const .all(8),
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  CupertinoThemeColorPreview(primaryColor: option.primaryColor, secondaryColor: option.secondaryColor),
                  CupertinoThemeCardLabel(name: option.name, isActive: isActive),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
