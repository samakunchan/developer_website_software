import 'dart:async';

import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/project_edit_dialog.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentProjectCard extends StatelessWidget {
  const FluentProjectCard({required this.project, required this.signals, super.key});

  final ProjectEntity project;
  final ProjectsSignals signals;

  void _onToggleFeatured(BuildContext context) {
    unawaited(signals.toggleProjectFeatured(project.id));
  }

  void _onEdit(BuildContext context) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (BuildContext context) => ProjectEditDialog(project: project, signals: signals)
      )
    );
  }

  void _onDelete(BuildContext context) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return ContentDialog(
            title: const Text('Delete Project'),
            content: Text('Are you sure you want to delete "${project.title}"? This action cannot be undone.'),
            actions: [
              Button(
                onPressed: Navigator.of(context).pop,
                child: const Text('Cancel'),
              ),
              FilledButton(
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
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color cardBg = isDark ? kCardDarkBgColor : Colors.white;
    final Color borderColor = isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0);
    final ProjectImageEntity? img = project.image;

    return Container(
      padding: const .all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: .circular(10),
        border: .all(color: borderColor, width: 0.5),
      ),
      child: Row(
        children: [
          /// 1. Project Image
          ClipRRect(
            borderRadius: .circular(6),
            child: SizedBox(
              width: 80,
              height: 80,
              child: img != null && img.medium.url.isNotEmpty
                  ? Image.network(
                      img.medium.url,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _buildPlaceholder(theme),
                    )
                  : _buildPlaceholder(theme),
            ),
          ),
          const SizedBox(width: 16),

          /// 2. Project details
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Text(project.title, style: theme.typography.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                    if (project.isFeatured) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const .symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.15),
                          borderRadius: .circular(4),
                        ),
                        child: Row(
                          mainAxisSize: .min,
                          spacing: 3,
                          children: [
                            Icon(FluentIcons.favorite_star_fill, color: Colors.orange, size: 10),
                            Text(
                              'Featured',
                              style: theme.typography.caption?.copyWith(color: Colors.orange, fontSize: 9, fontWeight: .bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  project.description,
                  style: theme.typography.body?.copyWith(color: theme.resources.textFillColorSecondary),
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const .symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.accentColor.withValues(alpha: 0.1),
                        borderRadius: .circular(4),
                      ),
                      child: Text(
                        project.categoryLabel.isNotEmpty ? project.categoryLabel : project.category.toUpperCase(),
                        style: theme.typography.caption?.copyWith(
                          color: theme.accentColor,
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
          const SizedBox(width: 16),

          /// 3. Action Buttons
          SignalBuilder(
            builder: (BuildContext context) {
              final bool togglingFeatured = signals.isFeaturedToggling.value[project.id] ?? false;
              final bool deleting = signals.isDeleting.value[project.id] ?? false;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Toggle Featured Star
                  if (togglingFeatured)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: SizedBox(width: 16, height: 16, child: ProgressRing(strokeWidth: 2)),
                    )
                  else
                    IconButton(
                      icon: Icon(
                        project.isFeatured ? FluentIcons.favorite_star_fill : FluentIcons.favorite_star,
                        color: project.isFeatured ? Colors.orange : theme.resources.textFillColorTertiary,
                        size: 20,
                      ),
                      onPressed: () => _onToggleFeatured(context),
                    ),

                  /// Edit Button
                  IconButton(
                    icon: Icon(
                      FluentIcons.edit,
                      color: theme.accentColor,
                      size: 20
                    ),
                    onPressed: () => _onEdit(context)
                  ),

                  /// Delete Button
                  if (deleting)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: SizedBox(width: 16, height: 16, child: ProgressRing(strokeWidth: 2)),
                    )
                  else
                    IconButton(
                      icon: Icon(FluentIcons.delete, color: Colors.red, size: 20),
                      onPressed: () => _onDelete(context),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(FluentThemeData theme) {
    return ColoredBox(
      color: theme.resources.cardStrokeColorDefault,
      child: Center(child: Icon(FluentIcons.photo2, color: theme.resources.textFillColorSecondary, size: 28)),
    );
  }
}
