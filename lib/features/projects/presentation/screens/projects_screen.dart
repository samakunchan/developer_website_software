import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/projects/presentation/screens/macos/cupertino_projects_scaffold.dart';
import 'package:developer_website_software/features/projects/presentation/screens/others/material_projects_scaffold.dart';
import 'package:developer_website_software/features/projects/presentation/screens/windows/fluent_projects_scaffold.dart';
import 'package:flutter/widgets.dart';

class ProjectsScreen extends PlatformWidget {
  const ProjectsScreen({this.isActive = false, super.key});

  final bool isActive;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoProjectsScaffold(isActive: isActive);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentProjectsScaffold(isActive: isActive);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialProjectsScaffold(isActive: isActive);
  }
}
