import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/windows/components/fluent_theme_card_label.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/windows/components/fluent_theme_color_preview.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentThemeOptionCard extends StatelessWidget {
  const FluentThemeOptionCard({
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
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;

    return Card(
      padding: .zero,
      borderRadius: .circular(8),
      borderColor: isActive ? theme.accentColor : theme.resources.dividerStrokeColorDefault,
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: Container(
          width: 200,
          color: isDark ? kCardDarkBgColor : theme.scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              FluentThemeColorPreview(primaryColor: option.primaryColor, secondaryColor: option.secondaryColor),
              FluentThemeCardLabel(name: option.name, isActive: isActive),
            ],
          ),
        ),
      ),
    );
  }
}
