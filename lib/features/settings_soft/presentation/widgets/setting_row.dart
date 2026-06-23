import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_setting_row.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_setting_row.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_setting_row.dart';
import 'package:flutter/widgets.dart';

class SettingRow extends PlatformWidget {
  const SettingRow({required this.label, required this.child, super.key});
  final String label;
  final Widget child;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoSettingRow(label: label, child: child);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentSettingRow(label: label, child: child);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialSettingRow(label: label, child: child);
  }
}
