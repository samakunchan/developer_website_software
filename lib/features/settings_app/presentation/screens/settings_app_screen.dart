import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/settings_app/presentation/screens/macos/cupertino_settings_app_scaffold.dart';
import 'package:developer_website_software/features/settings_app/presentation/screens/others/material_settings_app_scaffold.dart';
import 'package:developer_website_software/features/settings_app/presentation/screens/windows/fluent_settings_app_scaffold.dart';
import 'package:flutter/widgets.dart';

class SettingsAppScreen extends PlatformWidget {
  const SettingsAppScreen({super.key});

  @override
  Widget buildCupertino(BuildContext context) {
    return const CupertinoSettingsAppScaffold();
  }

  @override
  Widget buildFluent(BuildContext context) {
    return const FluentSettingsAppScaffold();
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return const MaterialSettingsAppScaffold();
  }
}
