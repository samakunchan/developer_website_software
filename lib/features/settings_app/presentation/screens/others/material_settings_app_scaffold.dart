import 'package:developer_website_software/features/settings_app/presentation/widgets/others/material_settings_main_content_area.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/others/material_settings_sidebar.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/material.dart';

class MaterialSettingsAppScaffold extends StatefulWidget {
  const MaterialSettingsAppScaffold({this.isActive = false, super.key});

  final bool isActive;

  @override
  State<MaterialSettingsAppScaffold> createState() => _MaterialSettingsAppScaffoldState();
}

class _MaterialSettingsAppScaffoldState extends State<MaterialSettingsAppScaffold> {
  int _selectedSectionIndex = 0;

  final List<String> _sections = ['Themes', 'Legal Mentions', 'CGU', 'Privacy Policy', 'Cookie Policy'];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color sidebarBorder = isDark ? const Color(0xFF1E293B) : LightThemeConstants.glassBorder;

    return Row(
      children: [
        /// 1. Secondary Sidebar
        MaterialSettingsSidebar(
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
            child: MaterialSettingsMainContentArea(selectedSectionIndex: _selectedSectionIndex, isActive: widget.isActive),
          ),
        ),
      ],
    );
  }
}
