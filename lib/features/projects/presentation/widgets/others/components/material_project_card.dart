import 'dart:async';

import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/project_edit_dialog.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialProjectCard extends StatelessWidget {
  const MaterialProjectCard({required this.project, required this.signals, super.key});

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
    final ThemeData theme = Theme.of(context);
    unawaited(
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Project'),
            content: Text('Are you sure you want to delete "${project.title}"? This action cannot be undone.'),
            actions: [
              TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: theme.colorScheme.error),
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
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color cardBg = isDark ? kCardDarkBgColor : theme.cardColor;
    final Color borderColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;
    final ProjectImageEntity? img = project.image;

    return Card(
      color: cardBg,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(12),
        side: BorderSide(color: borderColor, width: 0.5),
      ),
      child: Padding(
        padding: const .all(16),
        child: Row(
          children: [
            /// 1. Project Image
            ClipRRect(
              borderRadius: .circular(8),
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
                      Text(project.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: .bold)),
                      if (project.isFeatured) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const .symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: Colors.amber.withValues(alpha: 0.15), borderRadius: .circular(4)),
                          child: Row(
                            mainAxisSize: .min,
                            spacing: 3,
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 10),
                              Text(
                                'Featured',
                                style: theme.textTheme.bodySmall?.copyWith(color: Colors.amber, fontSize: 9, fontWeight: .bold),
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
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7)),
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const .symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: .circular(4),
                        ),
                        child: Text(
                          project.categoryLabel.isNotEmpty ? project.categoryLabel : project.category.toUpperCase(),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.primary,
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
                        child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                      )
                    else
                      IconButton(
                        icon: Icon(
                          project.isFeatured ? Icons.star : Icons.star_border,
                          color: project.isFeatured ? Colors.amber : Colors.grey,
                          size: 20
                        ),
                        onPressed: () => _onToggleFeatured(context)
                      ),

                    /// Edit Button
                    IconButton(
                      icon: Icon(
                        Icons.edit_outlined,
                        color: theme.colorScheme.primary,
                        size: 20
                      ),
                      onPressed: () => _onEdit(context)
                    ),

                    /// Delete Button
                    if (deleting)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                      )
                    else
                      IconButton(
                        icon: Icon(Icons.delete_outline, color: theme.colorScheme.error, size: 20),
                        onPressed: () => _onDelete(context)
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(ThemeData theme) {
    return ColoredBox(
      color: theme.brightness == .dark ? Colors.grey.shade900 : Colors.grey.shade200,
      child: Center(child: Icon(Icons.image, color: Colors.grey.shade400, size: 28)),
    );
  }
}
