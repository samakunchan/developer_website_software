import 'dart:async';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/cupertino_projects_main_content_area.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/cupertino_projects_sidebar.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';

class CupertinoProjectsScaffold extends StatefulWidget {
  const CupertinoProjectsScaffold({this.isActive = false, super.key});

  final bool isActive;

  @override
  State<CupertinoProjectsScaffold> createState() => _CupertinoProjectsScaffoldState();
}

class _CupertinoProjectsScaffoldState extends State<CupertinoProjectsScaffold> {
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
  void didUpdateWidget(CupertinoProjectsScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      unawaited(_signals.fetchProjects());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// 1. Category Filter Sidebar
        CupertinoProjectsSidebar(signals: _signals),

        /// Vertical Divider
        Container(width: 1, color: kSidebarBorderColor),

        /// 2. Projects Main Content Pane
        Expanded(
          child: Padding(
            padding: const .all(24),
            child: CupertinoProjectsMainContentArea(signals: _signals),
          ),
        ),
      ],
    );
  }
}
