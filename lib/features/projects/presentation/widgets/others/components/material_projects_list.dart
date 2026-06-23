import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/viewmodels/project_view_model.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/others/components/material_project_card.dart';
import 'package:flutter/material.dart';

class MaterialProjectsList extends StatelessWidget {
  const MaterialProjectsList({
    required this.projects,
    required this.signals,
    super.key
  });

  final List<ProjectViewModel> projects;
  final ProjectsSignals signals;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: projects.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 12),
      itemBuilder: (BuildContext context, int index) {
        final ProjectViewModel project = projects[index];
        return MaterialProjectCard(key: ValueKey<int>(project.id), project: project, signals: signals);
      }
    );
  }
}
