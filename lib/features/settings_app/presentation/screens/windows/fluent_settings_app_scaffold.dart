import 'package:developer_website_software/features/settings_app/presentation/widgets/windows/fluent_settings_main_content_area.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/windows/fluent_settings_sidebar.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentSettingsAppScaffold extends StatefulWidget {
  const FluentSettingsAppScaffold({this.isActive = false, super.key});

  final bool isActive;

  @override
  State<FluentSettingsAppScaffold> createState() => _FluentSettingsAppScaffoldState();
}

class _FluentSettingsAppScaffoldState extends State<FluentSettingsAppScaffold> {
  int _selectedSectionIndex = 0;

  final List<String> _sections = ['Themes', 'Legal Mentions', 'CGU', 'Privacy Policy', 'Cookie Policy'];

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color sidebarBorder = isDark ? const Color(0xFF1E293B) : LightThemeConstants.glassBorder;

    return Row(
      children: [
        /// 1. Secondary Sidebar
        FluentSettingsSidebar(
          selectedSectionIndex: _selectedSectionIndex,
          sections: _sections,
          onSelectSection: (int index) {
            setState(() => _selectedSectionIndex = index);
          },
        ),

        /// Vertical Divider
        Container(width: 1, color: sidebarBorder),

        /// 2. Content Pane
        Expanded(
          child: Padding(
            padding: const .all(24),
            child: FluentSettingsMainContentArea(selectedSectionIndex: _selectedSectionIndex, isActive: widget.isActive),
          ),
        ),
      ],
    );
  }
}
