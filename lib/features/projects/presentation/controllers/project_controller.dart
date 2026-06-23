import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/core/extensions/string_extension.dart';
import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/enums/enums.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ProjectController {
  ProjectController(this.signals, {this.project});

  final ProjectsSignals signals;
  final ProjectEntity? project;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryLabelController = TextEditingController();
  final TextEditingController caseStudyNumberController = TextEditingController();

  final TextEditingController newTechNameController = TextEditingController();
  final TextEditingController newTechIconController = TextEditingController();

  final TextEditingController newFeatureIconController = TextEditingController();
  final TextEditingController newFeatureTitleController = TextEditingController();
  final TextEditingController newFeatureDescController = TextEditingController();

  final Signal<String> category = signal<String>('web');
  final Signal<String> status = signal<String>('draft');
  final Signal<bool> isFeatured = signal<bool>(false);
  final Signal<bool> isLoading = signal<bool>(false);
  final Signal<String?> errorMessage = signal<String?>(null);
  final Signal<String> titleSignal = signal<String>('');
  final Signal<int> activeStep = signal<int>(0);
  final Signal<ProjectEntity?> createdProject = signal<ProjectEntity?>(null);

  final Signal<List<TechStackItem>> techStack = signal<List<TechStackItem>>([]);
  final Signal<List<ProjectFeatureItem>> features = signal<List<ProjectFeatureItem>>([]);

  late final Computed<bool> canGoNext = computed<bool>(() {
    if (isLoading.value) return false;
    if (activeStep.value == 0) {
      return titleSignal.value.trim().isNotEmpty;
    }
    return true;
  });

  void init() {
    titleController.addListener(_onTitleChanged);
    if (project != null) {
      final ProjectEntity p = project!;
      titleController.text = p.title;
      slugController.text = p.slug;
      descriptionController.text = p.description;
      categoryLabelController.text = p.categoryLabel;
      caseStudyNumberController.text = p.caseStudyNumber ?? '';
      category.value = p.category;
      status.value = p.status;
      isFeatured.value = p.isFeatured;
      titleSignal.value = p.title;
      techStack.value = p.techStack;
      features.value = p.features;
      createdProject.value = p;
    }
  }

  void dispose() {
    titleController
      ..removeListener(_onTitleChanged)
      ..dispose();
    slugController.dispose();
    descriptionController.dispose();
    categoryLabelController.dispose();
    caseStudyNumberController.dispose();
    newTechNameController.dispose();
    newTechIconController.dispose();
    newFeatureIconController.dispose();
    newFeatureTitleController.dispose();
    newFeatureDescController.dispose();
  }

  void _onTitleChanged() {
    titleSignal.value = titleController.text;
    slugController.text = titleController.text.slugify();
  }

  void addTechStackItem() {
    final String name = newTechNameController.text.trim();
    final String icon = newTechIconController.text.trim();
    if (name.isNotEmpty) {
      techStack.value = [...techStack.value, TechStackItem(name: name, icon: icon.isEmpty ? 'code' : icon)];
      newTechNameController.clear();
      newTechIconController.clear();
    }
  }

  void removeTechStackItem(int index) {
    techStack.value = List<TechStackItem>.from(techStack.value)..removeAt(index);
  }

  void addFeatureItem() {
    final String title = newFeatureTitleController.text.trim();
    final String icon = newFeatureIconController.text.trim();
    final String desc = newFeatureDescController.text.trim();
    if (title.isNotEmpty) {
      features.value = [
        ...features.value,
        ProjectFeatureItem(icon: icon.isEmpty ? 'star' : icon, title: title, description: desc)
      ];
      newFeatureTitleController.clear();
      newFeatureIconController.clear();
      newFeatureDescController.clear();
    }
  }

  void removeFeatureItem(int index) {
    features.value = List<ProjectFeatureItem>.from(features.value)..removeAt(index);
  }

  Future<bool> onNextStep() async {
    errorMessage.value = null;
    final int step = activeStep.value;

    switch (step) {
      case 0:
        if (titleController.text.trim().isEmpty) {
          errorMessage.value = 'Title is required';
          return false;
        }
        isLoading.value = true;
        if (createdProject.value == null) {
          final CreateProjectParams params = CreateProjectParams(
            slug: slugController.text,
            title: titleController.text.trim(),
            description: descriptionController.text.trim(),
            category: category.value,
            categoryLabel: categoryLabelController.text.trim()
          );
          final Either<Failure, ProjectEntity> result = await signals.createProject(params);
          isLoading.value = false;
          return result.fold((Failure failure) {
            errorMessage.value = failure.message;
            return false;
          }, (ProjectEntity project) {
            createdProject.value = project;
            activeStep.value = 1;
            return false;
          });
        } else {
          final UpdateProjectParams params = UpdateProjectParams(
            id: createdProject.value!.id,
            slug: slugController.text,
            title: titleController.text.trim(),
            description: descriptionController.text.trim(),
            category: category.value,
            categoryLabel: categoryLabelController.text.trim(),
            status: 'draft',
            isFeatured: isFeatured.value
          );
          final Either<Failure, ProjectEntity> result = await signals.updateProject(params);
          isLoading.value = false;
          return result.fold((Failure failure) {
            errorMessage.value = failure.message;
            return false;
          }, (ProjectEntity project) {
            createdProject.value = project;
            activeStep.value = 1;
            return false;
          });
        }
      case 1:
        if (createdProject.value == null) return false;
        addTechStackItem();
        addFeatureItem();
        isLoading.value = true;
        final UpdateProjectParams params = UpdateProjectParams(
          id: createdProject.value!.id,
          slug: slugController.text,
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          category: category.value,
          categoryLabel: categoryLabelController.text.trim(),
          caseStudyNumber: caseStudyNumberController.text.trim().isEmpty ? null : caseStudyNumberController.text.trim(),
          status: 'draft',
          isFeatured: isFeatured.value,
          techIcons: techStack.value.map((TechStackItem e) => e.icon).toList(),
          techStack: techStack.value,
          features: features.value
        );
        final Either<Failure, ProjectEntity> result = await signals.updateProject(params);
        isLoading.value = false;
        return result.fold((Failure failure) {
          errorMessage.value = failure.message;
          return false;
        }, (ProjectEntity project) {
          createdProject.value = project;
          activeStep.value = 2;
          return false;
        });
      case 2:
        if (createdProject.value == null) return false;
        isLoading.value = true;
        final UpdateProjectParams params = UpdateProjectParams(
          id: createdProject.value!.id,
          slug: slugController.text,
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          category: category.value,
          categoryLabel: categoryLabelController.text.trim(),
          caseStudyNumber: caseStudyNumberController.text.trim().isEmpty ? null : caseStudyNumberController.text.trim(),
          status: status.value,
          isFeatured: isFeatured.value,
          techIcons: techStack.value.map((TechStackItem e) => e.icon).toList(),
          techStack: techStack.value,
          features: features.value
        );
        final Either<Failure, ProjectEntity> result = await signals.updateProject(params);
        isLoading.value = false;
        return result.fold((Failure failure) {
          errorMessage.value = failure.message;
          return false;
        }, (ProjectEntity project) {
          createdProject.value = project;
          return true;
        });
      default:
        return false;
    }
  }

  Future<bool> saveEditedProject() async {
    if (createdProject.value == null) return false;
    errorMessage.value = null;
    if (titleController.text.trim().isEmpty) {
      errorMessage.value = 'Title is required';
      return false;
    }

    addTechStackItem();
    addFeatureItem();

    isLoading.value = true;
    final UpdateProjectParams params = UpdateProjectParams(
      id: createdProject.value!.id,
      slug: slugController.text,
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      category: category.value,
      categoryLabel: categoryLabelController.text.trim(),
      caseStudyNumber: caseStudyNumberController.text.trim().isEmpty ? null : caseStudyNumberController.text.trim(),
      status: status.value,
      isFeatured: isFeatured.value,
      techIcons: techStack.value.map((TechStackItem e) => e.icon).toList(),
      techStack: techStack.value,
      features: features.value
    );

    final Either<Failure, ProjectEntity> result = await signals.updateProject(params);
    isLoading.value = false;
    return result.fold((Failure failure) {
      errorMessage.value = failure.message;
      return false;
    }, (ProjectEntity _) {
      return true;
    });
  }

  void onBackStep() {
    if (activeStep.value > 0) {
      activeStep.value = activeStep.value - 1;
    }
  }

  static String categoryDisplay(String value) {
    return CategoryDisplay.values.firstWhere((CategoryDisplay e) => e.key == value, orElse: () => CategoryDisplay.web).value;
  }

  static String statusDisplay(String value) {
    return StatusDisplay.values.firstWhere((StatusDisplay e) => e.key == value, orElse: () => StatusDisplay.draft).value;
  }
}
