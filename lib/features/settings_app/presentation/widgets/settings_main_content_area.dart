import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/macos/cupertino_settings_main_content_area.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/others/material_settings_main_content_area.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/windows/fluent_settings_main_content_area.dart';
import 'package:flutter/widgets.dart';

class SettingsMainContentArea extends PlatformWidget {
  const SettingsMainContentArea({
    required this.selectedSectionIndex,
    super.key
  });

  final int selectedSectionIndex;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoSettingsMainContentArea(selectedSectionIndex: selectedSectionIndex);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentSettingsMainContentArea(selectedSectionIndex: selectedSectionIndex);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialSettingsMainContentArea(selectedSectionIndex: selectedSectionIndex);
  }
}
