import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_general_tab.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_general_tab.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_general_tab.dart';
import 'package:flutter/widgets.dart';

class GeneralTab extends PlatformWidget {
  const GeneralTab({required this.settings, super.key});
  final SettingsSoftSignals settings;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoGeneralTab(settings: settings);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentGeneralTab(settings: settings);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialGeneralTab(settings: settings);
  }
}
