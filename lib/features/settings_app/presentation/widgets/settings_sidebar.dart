import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/macos/cupertino_settings_sidebar.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/others/material_settings_sidebar.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/windows/fluent_settings_sidebar.dart';
import 'package:flutter/widgets.dart';

class SettingsSidebar extends PlatformWidget {
  const SettingsSidebar({
    required this.selectedSectionIndex,
    required this.sections,
    required this.onSelectSection,
    super.key
  });

  final int selectedSectionIndex;
  final List<String> sections;
  final ValueChanged<int> onSelectSection;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoSettingsSidebar(
      selectedSectionIndex: selectedSectionIndex,
      sections: sections,
      onSelectSection: onSelectSection
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentSettingsSidebar(
      selectedSectionIndex: selectedSectionIndex,
      sections: sections,
      onSelectSection: onSelectSection
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialSettingsSidebar(
      selectedSectionIndex: selectedSectionIndex,
      sections: sections,
      onSelectSection: onSelectSection
    );
  }
}
