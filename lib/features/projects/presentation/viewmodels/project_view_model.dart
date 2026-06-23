import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ProjectViewModel {
  ProjectViewModel(ProjectEntity project)
    : _project = project,
      isFeatured = signal(project.isFeatured),
      status = signal(project.status);

  ProjectEntity _project;
  ProjectEntity get project => _project;

  final Signal<bool> isFeatured;
  final Signal<String> status;

  void updateFromEntity(ProjectEntity newEntity) {
    _project = newEntity;
    isFeatured.value = newEntity.isFeatured;
    status.value = newEntity.status;
  }

  int get id => _project.id;
  String get slug => _project.slug;
  String get title => _project.title;
  String get description => _project.description;
  String get category => _project.category;
  String get categoryLabel => _project.categoryLabel;
  String? get caseStudyNumber => _project.caseStudyNumber;
  List<String> get techIcons => _project.techIcons;
  List<TechStackItem> get techStack => _project.techStack;
  List<ProjectFeatureItem> get features => _project.features;
  int get userId => _project.userId;
  ProjectImageEntity? get image => _project.image;
  String get createdAt => _project.createdAt;
  String get updatedAt => _project.updatedAt;
}

extension ProjectViewModelExtension on List<ProjectViewModel> {
  List<ProjectViewModel> sortedByDateDesc() {
    return this..sort((ProjectViewModel a, ProjectViewModel b) {
      final DateTime dateA = DateTime.tryParse(a.createdAt) ?? DateTime(1970);
      final DateTime dateB = DateTime.tryParse(b.createdAt) ?? DateTime(1970);
      return dateB.compareTo(dateA);
    });
  }

  List<ProjectViewModel> sortedByDateAsc() {
    return this..sort((ProjectViewModel a, ProjectViewModel b) {
      final DateTime dateA = DateTime.tryParse(a.createdAt) ?? DateTime(1970);
      final DateTime dateB = DateTime.tryParse(b.createdAt) ?? DateTime(1970);
      return dateA.compareTo(dateB);
    });
  }
}
