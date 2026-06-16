import 'package:developer_website_software/features/settings_app/presentation/widgets/settings_main_content_area.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/settings_sidebar.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSettingsAppScaffold extends StatefulWidget {
  const CupertinoSettingsAppScaffold({super.key});

  @override
  State<CupertinoSettingsAppScaffold> createState() => _CupertinoSettingsAppScaffoldState();
}

class _CupertinoSettingsAppScaffoldState extends State<CupertinoSettingsAppScaffold> {
  int _selectedSectionIndex = 0;

  final List<String> _sections = [
    'Themes',
    'Legal Mentions',
    'CGU',
    'Privacy Policy',
    'Cookie Policy'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// 1. Secondary Sidebar
        SettingsSidebar(
          selectedSectionIndex: _selectedSectionIndex,
          sections: _sections,
          onSelectSection: (int index) {
            setState(() => _selectedSectionIndex = index);
          }
        ),

        /// Vertical Divider
        Container(
          width: 1,
          color: kSidebarBorderColor
        ),

        /// 2. Content Pane
        Expanded(
          child: Padding(
            padding: const .all(24),
            child: SettingsMainContentArea(selectedSectionIndex: _selectedSectionIndex)
          )
        )
      ]
    );
  }
}
