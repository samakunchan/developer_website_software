import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_info_row.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_info_row.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_info_row.dart';
import 'package:flutter/widgets.dart';

class InfoRow extends PlatformWidget {
  const InfoRow({required this.label, required this.value, super.key});
  final String label;
  final String value;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoInfoRow(label: label, value: value);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentInfoRow(label: label, value: value);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialInfoRow(label: label, value: value);
  }
}
