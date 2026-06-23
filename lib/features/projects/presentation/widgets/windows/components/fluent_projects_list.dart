import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/windows/components/fluent_project_card.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentProjectsList extends StatelessWidget {
  const FluentProjectsList({
    required this.projects,
    required this.signals,
    super.key
  });

  final List<ProjectEntity> projects;
  final ProjectsSignals signals;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: projects.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 12),
      itemBuilder: (BuildContext context, int index) {
        final ProjectEntity project = projects[index];
        return FluentProjectCard(key: ValueKey<int>(project.id), project: project, signals: signals);
      }
    );
  }
}
