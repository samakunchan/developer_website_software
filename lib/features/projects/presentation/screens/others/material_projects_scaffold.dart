import 'dart:async';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/others/material_projects_main_content_area.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/others/material_projects_sidebar.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/material.dart';

class MaterialProjectsScaffold extends StatefulWidget {
  const MaterialProjectsScaffold({this.isActive = false, super.key});

  final bool isActive;

  @override
  State<MaterialProjectsScaffold> createState() => _MaterialProjectsScaffoldState();
}

class _MaterialProjectsScaffoldState extends State<MaterialProjectsScaffold> {
  late final ProjectsSignals _signals;

  @override
  void initState() {
    super.initState();
    _signals = kGetIt<ProjectsSignals>();

    if (widget.isActive) {
      unawaited(_signals.fetchProjects());
    }
  }

  @override
  void didUpdateWidget(MaterialProjectsScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      unawaited(_signals.fetchProjects());
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color sidebarBorder = isDark ? const Color(0xFF1E293B) : LightThemeConstants.glassBorder;

    return Row(
      children: [
        /// 1. Category Filter Sidebar
        MaterialProjectsSidebar(signals: _signals),

        /// Vertical Divider
        Container(width: 1, color: sidebarBorder),

        /// 2. Projects Main Content Pane
        Expanded(
          child: Padding(
            padding: const .all(24),
            child: MaterialProjectsMainContentArea(signals: _signals),
          ),
        ),
      ],
    );
  }
}
