import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_settings_soft_divider.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_settings_soft_divider.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_settings_soft_divider.dart';
import 'package:flutter/widgets.dart';

class SettingsSoftDivider extends PlatformWidget {
  const SettingsSoftDivider({this.height = 1, this.color, super.key});
  final double height;
  final Color? color;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoSettingsSoftDivider(height: height, color: color);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentSettingsSoftDivider(height: height, color: color);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialSettingsSoftDivider(height: height, color: color);
  }
}
