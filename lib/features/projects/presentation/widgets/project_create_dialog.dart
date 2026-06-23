import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/cupertino_project_create_dialog.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/others/material_project_create_dialog.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/windows/fluent_project_create_dialog.dart';
import 'package:flutter/cupertino.dart';

class ProjectCreateDialog extends PlatformWidget {
  const ProjectCreateDialog({required this.signals, super.key});

  final ProjectsSignals signals;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoProjectCreateDialog(signals: signals);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentProjectCreateDialog(signals: signals);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialProjectCreateDialog(signals: signals);
  }
}
