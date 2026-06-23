import 'dart:async';

import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/viewmodels/project_view_model.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_projects_list.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/project_create_dialog.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:developer_website_software/features/themes/widgets/cupertino_app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoProjectsMainContentArea extends StatelessWidget {
  const CupertinoProjectsMainContentArea({required this.signals, super.key});

  final ProjectsSignals signals;

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (BuildContext context) {
        final List<ProjectViewModel> displayProjects = signals.filteredProjects.value;
        final bool isLoading = signals.isLoading.value;
        final String? error = signals.errorMessage.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Area
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        'Projects',
                        style: CupertinoTheme.of(
                          context,
                        ).textTheme.navTitleTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Manage portfolio projects, categories, and featured selections.',
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: CupertinoColors.secondaryLabel),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: .min,
                  spacing: 8,
                  children: [
                    CupertinoAppButton(
                      onPressed: () {
                        unawaited(
                          showCupertinoDialog<void>(
                            context: context,
                            builder: (BuildContext context) => ProjectCreateDialog(signals: signals),
                          ),
                        );
                      },
                      child: const Icon(CupertinoIcons.add, size: 20),
                    ),
                    if (isLoading)
                      const CupertinoActivityIndicator()
                    else
                      CupertinoAppButton(
                        onPressed: () => unawaited(signals.fetchProjects()),
                        child: const Icon(CupertinoIcons.refresh, size: 20),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Error notification
            if (error != null) ...[
              Container(
                padding: const .all(12),
                decoration: BoxDecoration(
                  color: kDangerColor.withValues(alpha: 0.1),
                  borderRadius: .circular(8),
                  border: .all(color: kDangerColor.withValues(alpha: 0.3)),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    const Icon(CupertinoIcons.exclamationmark_triangle_fill, color: kDangerColor, size: 16),
                    Expanded(
                      child: Text(
                        error,
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: kDangerColor, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],

            /// Projects Content
            Expanded(
              child: isLoading && displayProjects.isEmpty
                  ? const Center(child: CupertinoActivityIndicator())
                  : displayProjects.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          const Icon(CupertinoIcons.folder_open, size: 48, color: CupertinoColors.systemGrey3),
                          const SizedBox(height: 12),
                          Text(
                            'No projects found.',
                            style: CupertinoTheme.of(
                              context,
                            ).textTheme.textStyle.copyWith(color: CupertinoColors.secondaryLabel, fontWeight: .bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Add projects to showcase them in your portfolio.',
                            style: CupertinoTheme.of(
                              context,
                            ).textTheme.actionSmallTextStyle.copyWith(color: CupertinoColors.secondaryLabel),
                          ),
                        ],
                      ),
                    )
                  : CupertinoProjectsList(projects: displayProjects, signals: signals),
            ),
          ],
        );
      },
    );
  }
}
