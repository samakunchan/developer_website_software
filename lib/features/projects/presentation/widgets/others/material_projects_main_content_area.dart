import 'dart:async';

import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/others/components/material_projects_list.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/project_create_dialog.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialProjectsMainContentArea extends StatelessWidget {
  const MaterialProjectsMainContentArea({required this.signals, super.key});

  final ProjectsSignals signals;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SignalBuilder(
      builder: (BuildContext context) {
        final List<ProjectEntity> displayProjects = signals.filteredProjects.value;
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
                      Text('Projects', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        'Manage portfolio projects, categories, and featured selections.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add, size: 20),
                      onPressed: () {
                        unawaited(
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) => ProjectCreateDialog(signals: signals)
                          )
                        );
                      }
                    ),
                    if (isLoading)
                      const CircularProgressIndicator()
                    else
                      IconButton(
                        icon: const Icon(Icons.refresh, size: 20),
                        onPressed: () => unawaited(signals.fetchProjects())
                      )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),

            /// Error Box
            if (error != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kDangerColor.withValues(alpha: 0.1),
                  borderRadius: .circular(8),
                  border: .all(color: kDangerColor.withValues(alpha: 0.3)),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: kDangerColor, size: 16),
                    Expanded(
                      child: Text(error, style: theme.textTheme.bodyMedium?.copyWith(color: kDangerColor)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],

            /// Projects list or Loading / Empty States
            Expanded(
              child: isLoading && displayProjects.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : displayProjects.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: .center,
                        spacing: 12,
                        children: [
                          Icon(Icons.folder_off_outlined, size: 48, color: theme.disabledColor),
                          Text(
                            'No projects found.',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.textTheme.titleMedium?.color?.withValues(alpha: 0.6),
                              fontWeight: .bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Add projects to showcase them in your portfolio.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    )
                  : MaterialProjectsList(projects: displayProjects, signals: signals),
            ),
          ],
        );
      },
    );
  }
}
