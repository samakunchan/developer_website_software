import 'dart:async';

import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/viewmodels/project_view_model.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/project_edit_dialog.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoProjectCard extends StatelessWidget {
  const CupertinoProjectCard({required this.project, required this.signals, super.key});

  final ProjectViewModel project;
  final ProjectsSignals signals;

  void _onToggleFeatured(BuildContext context) {
    unawaited(signals.toggleProjectFeatured(project.id));
  }

  void _onToggleStatus(BuildContext context) {
    unawaited(signals.toggleProjectStatus(project));
  }

  void _onEdit(BuildContext context) {
    unawaited(
      showCupertinoDialog<void>(
        context: context,
        builder: (_) => ProjectEditDialog(project: project.project, signals: signals),
      ),
    );
  }

  void _onDelete(BuildContext context) {
    unawaited(
      showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Delete Project'),
            content: Text('Are you sure you want to delete "${project.title}"? This action cannot be undone.'),
            actions: [
              CupertinoDialogAction(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                  unawaited(signals.deleteProject(project.id));
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;
    final Color cardBg = isDark ? kCardDarkBgColor : CupertinoColors.systemBackground;
    final Color borderColor = isDark ? CupertinoColors.systemGrey6 : CupertinoColors.systemGrey4;
    final ProjectImageEntity? img = project.image;

    return Container(
      padding: const .all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: .circular(12),
        border: .all(color: borderColor, width: 0.5),
      ),
      child: Row(
        spacing: 16,
        children: [
          /// 1. Project Image or Placeholder
          ClipRRect(
            borderRadius: .circular(8),
            child: SizedBox(
              width: 80,
              height: 80,
              child: img != null && img.medium.url.isNotEmpty
                  ? Image.network(img.medium.url, fit: .cover, errorBuilder: (_, _, _) => _buildPlaceholder())
                  : _buildPlaceholder(),
            ),
          ),

          /// 2. Project Details
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Text(
                      project.title,
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SignalBuilder(
                      builder: (BuildContext context) {
                        if (project.isFeatured.value) {
                          return Row(
                            mainAxisSize: .min,
                            children: [
                              const SizedBox(width: 8),
                              Container(
                                padding: const .symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemYellow.withValues(alpha: 0.15),
                                  borderRadius: .circular(4),
                                ),
                                child: Row(
                                  mainAxisSize: .min,
                                  spacing: 3,
                                  children: [
                                    const Icon(CupertinoIcons.star_fill, color: CupertinoColors.systemYellow, size: 10),
                                    Text(
                                      'Featured',
                                      style: CupertinoTheme.of(context).textTheme.actionSmallTextStyle.copyWith(
                                        color: CupertinoColors.systemYellow,
                                        fontSize: 9,
                                        fontWeight: .bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  project.description,
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    color: CupertinoColors.secondaryLabel,
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const .symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: CupertinoTheme.of(context).selectionHandleColor.withValues(alpha: 0.1),
                        borderRadius: .circular(4),
                      ),
                      child: Text(
                        project.categoryLabel.isNotEmpty ? project.categoryLabel : project.category.toUpperCase(),
                        style: CupertinoTheme.of(context).textTheme.actionSmallTextStyle.copyWith(
                          color: CupertinoTheme.of(context).selectionHandleColor,
                          fontSize: 10,
                          fontWeight: .bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Row(
            mainAxisSize: .min,
            children: [
              /// Toggle Featured Button
              SignalBuilder(
                builder: (BuildContext context) {
                  final bool isFeatured = project.isFeatured.value;
                  return CupertinoButton(
                    padding: const .all(8),
                    onPressed: () => _onToggleFeatured(context),
                    child: Icon(
                      isFeatured ? CupertinoIcons.star_fill : CupertinoIcons.star,
                      color: isFeatured ? CupertinoColors.systemYellow : CupertinoColors.systemGrey,
                      size: 20,
                    ),
                  );
                },
              ),

              /// Toggle Status Button
              SignalBuilder(
                builder: (BuildContext context) {
                  final String status = project.status.value;
                  return CupertinoButton(
                    padding: const .all(8),
                    onPressed: () => _onToggleStatus(context),
                    child: Icon(
                      status == 'published' ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                      color: status == 'published' ? CupertinoColors.activeGreen : CupertinoColors.systemGrey,
                      size: 20,
                    ),
                  );
                },
              ),

              /// Edit Button
              CupertinoButton(
                padding: const .all(8),
                onPressed: () => _onEdit(context),
                child: const Icon(CupertinoIcons.pencil, color: CupertinoColors.activeBlue, size: 20),
              ),

              /// Delete Button
              SignalBuilder(
                builder: (_) {
                  return CupertinoButton(
                    padding: const .all(8),
                    onPressed: () => _onDelete(context),
                    child: const Icon(CupertinoIcons.trash, color: kDangerColor, size: 20),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return const ColoredBox(
      color: CupertinoColors.systemGrey5,
      child: Center(child: Icon(CupertinoIcons.photo, color: CupertinoColors.systemGrey2, size: 30)),
    );
  }
}
