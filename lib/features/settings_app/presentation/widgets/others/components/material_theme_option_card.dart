import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/others/components/material_theme_card_label.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/others/components/material_theme_color_preview.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/material.dart';

class MaterialThemeOptionCard extends StatelessWidget {
  const MaterialThemeOptionCard({
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
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;

    return Card(
      clipBehavior: .antiAlias,
      elevation: isActive ? 4 : 1,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isActive ? theme.colorScheme.primary : theme.dividerColor.withValues(alpha: 0.2),
          width: isActive ? 2 : 1,
        ),
        borderRadius: .circular(12),
      ),
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Container(
          width: 200,
          color: isDark ? kCardDarkBgColor : theme.colorScheme.surface,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              MaterialThemeColorPreview(primaryColor: option.primaryColor, secondaryColor: option.secondaryColor),
              MaterialThemeCardLabel(name: option.name, isActive: isActive),
            ],
          ),
        ),
      ),
    );
  }
}
