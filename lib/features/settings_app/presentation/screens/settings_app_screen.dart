import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/settings_app/presentation/screens/macos/cupertino_settings_app_scaffold.dart';
import 'package:developer_website_software/features/settings_app/presentation/screens/others/material_settings_app_scaffold.dart';
import 'package:developer_website_software/features/settings_app/presentation/screens/windows/fluent_settings_app_scaffold.dart';
import 'package:flutter/widgets.dart';

class SettingsAppScreen extends PlatformWidget {
  const SettingsAppScreen({this.isActive = false, super.key});

  final bool isActive;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoSettingsAppScaffold(isActive: isActive);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentSettingsAppScaffold(isActive: isActive);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialSettingsAppScaffold(isActive: isActive);
  }
}
