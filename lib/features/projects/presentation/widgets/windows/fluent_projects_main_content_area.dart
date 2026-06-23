import 'dart:async';

import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/viewmodels/project_view_model.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/project_create_dialog.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/windows/components/fluent_projects_list.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentProjectsMainContentArea extends StatelessWidget {
  const FluentProjectsMainContentArea({required this.signals, super.key});

  final ProjectsSignals signals;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return SignalBuilder(
      builder: (BuildContext context) {
        final List<ProjectViewModel> displayProjects = signals.filteredProjects.value;
        final bool isLoading = signals.isLoading.value;
        final String? error = signals.errorMessage.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text('Projects', style: theme.typography.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        'Manage portfolio projects, categories, and featured selections.',
                        style: theme.typography.body?.copyWith(color: theme.resources.textFillColorSecondary),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: .min,
                  spacing: 8,
                  children: [
                    IconButton(
                      icon: const Icon(FluentIcons.add, size: 20),
                      onPressed: () {
                        unawaited(
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) => ProjectCreateDialog(signals: signals),
                          ),
                        );
                      },
                    ),
                    if (isLoading)
                      const SizedBox(width: 20, height: 20, child: ProgressRing(strokeWidth: 2))
                    else
                      IconButton(
                        icon: const Icon(FluentIcons.refresh, size: 20),
                        onPressed: () => unawaited(signals.fetchProjects()),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Error InfoBar
            if (error != null) ...[
              InfoBar(title: const Text('Error'), content: Text(error), severity: InfoBarSeverity.error),
              const SizedBox(height: 20),
            ],

            /// Projects List or Loading / Empty States
            Expanded(
              child: isLoading && displayProjects.isEmpty
                  ? const Center(child: ProgressRing())
                  : displayProjects.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          Icon(FluentIcons.fabric_folder_search, size: 48, color: theme.resources.textFillColorTertiary),
                          const SizedBox(height: 12),
                          Text(
                            'No projects found.',
                            style: theme.typography.subtitle?.copyWith(
                              color: theme.resources.textFillColorSecondary,
                              fontWeight: .bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Add projects to showcase them in your portfolio.',
                            style: theme.typography.body?.copyWith(color: theme.resources.textFillColorSecondary),
                          ),
                        ],
                      ),
                    )
                  : FluentProjectsList(projects: displayProjects, signals: signals),
            ),
          ],
        );
      },
    );
  }
}
