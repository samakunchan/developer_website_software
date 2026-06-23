import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/domain/usecases/create_project_use_case.dart';
import 'package:developer_website_software/features/projects/domain/usecases/delete_project_use_case.dart';
import 'package:developer_website_software/features/projects/domain/usecases/get_projects_use_case.dart';
import 'package:developer_website_software/features/projects/domain/usecases/toggle_project_featured_use_case.dart';
import 'package:developer_website_software/features/projects/domain/usecases/update_project_use_case.dart';
import 'package:developer_website_software/features/projects/presentation/viewmodels/project_view_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ProjectsSignals {
  ProjectsSignals({
    required this.getProjectsUseCase,
    required this.toggleProjectFeaturedUseCase,
    required this.createProjectUseCase,
    required this.updateProjectUseCase,
    required this.deleteProjectUseCase,
  });

  final GetProjectsUseCase getProjectsUseCase;
  final ToggleProjectFeaturedUseCase toggleProjectFeaturedUseCase;
  final CreateProjectUseCase createProjectUseCase;
  final UpdateProjectUseCase updateProjectUseCase;
  final DeleteProjectUseCase deleteProjectUseCase;

  final Signal<List<ProjectViewModel>> projects = signal<List<ProjectViewModel>>([]);
  final Signal<bool> isLoading = signal<bool>(false);
  final Signal<String?> errorMessage = signal<String?>(null);
  final Signal<String> activeFilter = signal<String>('all');

  final Signal<Map<int, bool>> isFeaturedToggling = signal<Map<int, bool>>({});
  final Signal<Map<int, bool>> isStatusToggling = signal<Map<int, bool>>({});
  final Signal<Map<int, bool>> isUpdating = signal<Map<int, bool>>({});
  final Signal<bool> isCreating = signal<bool>(false);
  final Signal<Map<int, bool>> isDeleting = signal<Map<int, bool>>({});

  late final Computed<List<ProjectViewModel>> filteredProjects = computed(() {
    final filter = activeFilter.value;
    final allProjects = projects.value;
    if (filter == 'all') {
      return allProjects;
    }
    return allProjects.where((ProjectViewModel p) => p.category == filter).toList();
  });

  Future<void> fetchProjects() async {
    isLoading.value = true;
    errorMessage.value = null;

    final Either<Failure, List<ProjectEntity>> result = await getProjectsUseCase();

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (List<ProjectEntity> list) {
        projects.value = list.map(ProjectViewModel.new).toList().sortedByDateDesc();
        errorMessage.value = null;
      },
    );

    isLoading.value = false;
  }

  Future<void> toggleProjectFeatured(int id) async {
    isFeaturedToggling.value = {...isFeaturedToggling.value, id: true};
    errorMessage.value = null;

    final Either<Failure, ProjectEntity> result = await toggleProjectFeaturedUseCase(id);

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (ProjectEntity updated) {
        projects.value.firstWhere((ProjectViewModel p) => p.id == id).updateFromEntity(updated);
        errorMessage.value = null;
      },
    );

    isFeaturedToggling.value = {...isFeaturedToggling.value, id: false};
  }

  Future<void> toggleProjectStatus(ProjectViewModel vm) async {
    final int id = vm.id;
    isStatusToggling.value = {...isStatusToggling.value, id: true};
    errorMessage.value = null;

    final String nextStatus = vm.status.value == 'published' ? 'draft' : 'published';

    final UpdateProjectParams params = UpdateProjectParams(
      id: id,
      slug: vm.slug,
      title: vm.title,
      description: vm.description,
      category: vm.category,
      categoryLabel: vm.categoryLabel,
      caseStudyNumber: vm.caseStudyNumber,
      status: nextStatus,
      isFeatured: vm.isFeatured.value,
      techIcons: vm.techIcons,
      techStack: vm.techStack,
      features: vm.features,
    );

    final Either<Failure, ProjectEntity> result = await updateProjectUseCase(params);

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (ProjectEntity updated) {
        vm.updateFromEntity(updated);
        errorMessage.value = null;
      },
    );

    isStatusToggling.value = {...isStatusToggling.value, id: false};
  }

  Future<void> deleteProject(int id) async {
    isDeleting.value = {...isDeleting.value, id: true};
    errorMessage.value = null;

    final Either<Failure, void> result = await deleteProjectUseCase(id);

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (_) {
        projects.value = projects.value.where((ProjectViewModel p) => p.id != id).toList();
        errorMessage.value = null;
      },
    );

    isDeleting.value = {...isDeleting.value, id: false};
  }

  Future<Either<Failure, ProjectEntity>> updateProject(UpdateProjectParams params) async {
    final int id = params.id;
    isUpdating.value = {...isUpdating.value, id: true};
    errorMessage.value = null;

    final Either<Failure, ProjectEntity> result = await updateProjectUseCase(params);

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (ProjectEntity updated) {
        projects.value.firstWhere((ProjectViewModel p) => p.id == id).updateFromEntity(updated);
        projects.value = List<ProjectViewModel>.from(projects.value).sortedByDateDesc();
        errorMessage.value = null;
      },
    );

    isUpdating.value = {...isUpdating.value, id: false};
    return result;
  }

  Future<Either<Failure, ProjectEntity>> createProject(CreateProjectParams params) async {
    isCreating.value = true;
    errorMessage.value = null;

    final Either<Failure, ProjectEntity> result = await createProjectUseCase(params);

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (ProjectEntity newProject) {
        projects.value = [ProjectViewModel(newProject), ...projects.value].sortedByDateDesc();
        errorMessage.value = null;
      },
    );

    isCreating.value = false;
    return result;
  }
}
