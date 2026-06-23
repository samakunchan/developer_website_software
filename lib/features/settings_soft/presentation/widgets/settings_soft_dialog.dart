import 'package:developer_website_software/core/cross_platform/platform_stateful_widget.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_settings_soft_dialog.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_settings_soft_dialog.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_settings_soft_dialog.dart';
import 'package:flutter/widgets.dart';

class SettingsSoftDialog extends PlatformStatefulWidget {
  const SettingsSoftDialog({super.key});

  @override
  PlatformState<SettingsSoftDialog> createState() => _SettingsSoftDialogState();
}

class _SettingsSoftDialogState extends PlatformState<SettingsSoftDialog> {
  @override
  Widget buildCupertino(BuildContext context) {
    return const CupertinoSettingsSoftDialog();
  }

  @override
  Widget buildFluent(BuildContext context) {
    return const FluentSettingsSoftDialog();
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return const MaterialSettingsSoftDialog();
  }
}
