import 'dart:async';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/windows/fluent_projects_main_content_area.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/windows/fluent_projects_sidebar.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentProjectsScaffold extends StatefulWidget {
  const FluentProjectsScaffold({this.isActive = false, super.key});

  final bool isActive;

  @override
  State<FluentProjectsScaffold> createState() => _FluentProjectsScaffoldState();
}

class _FluentProjectsScaffoldState extends State<FluentProjectsScaffold> {
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
  void didUpdateWidget(FluentProjectsScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      unawaited(_signals.fetchProjects());
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color sidebarBorder = isDark ? const Color(0xFF1E293B) : LightThemeConstants.glassBorder;

    return Row(
      children: [
        /// 1. Category Filter Sidebar
        FluentProjectsSidebar(signals: _signals),

        /// Vertical Divider
        Container(width: 1, color: sidebarBorder),

        /// 2. Projects Main Content Pane
        Expanded(
          child: Padding(
            padding: const .all(24),
            child: FluentProjectsMainContentArea(signals: _signals),
          ),
        ),
      ],
    );
  }
}
