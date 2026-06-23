import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/cupertino_project_edit_dialog.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/others/material_project_edit_dialog.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/windows/fluent_project_edit_dialog.dart';
import 'package:flutter/cupertino.dart';

class ProjectEditDialog extends PlatformWidget {
  const ProjectEditDialog({required this.project, required this.signals, super.key});

  final ProjectEntity project;
  final ProjectsSignals signals;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoProjectEditDialog(project: project, signals: signals);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentProjectEditDialog(project: project, signals: signals);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialProjectEditDialog(project: project, signals: signals);
  }
}
