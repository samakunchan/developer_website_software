import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
abstract class TechStackItemModel with _$TechStackItemModel {
  const factory TechStackItemModel({required String name, required String icon}) = _TechStackItemModel;

  const TechStackItemModel._();

  factory TechStackItemModel.fromJson(Map<String, dynamic> json) => _$TechStackItemModelFromJson(json);

  TechStackItem toEntity() => TechStackItem(name: name, icon: icon);
}

@freezed
abstract class ProjectFeatureItemModel with _$ProjectFeatureItemModel {
  const factory ProjectFeatureItemModel({required String icon, required String title, required String description}) =
      _ProjectFeatureItemModel;

  const ProjectFeatureItemModel._();

  factory ProjectFeatureItemModel.fromJson(Map<String, dynamic> json) => _$ProjectFeatureItemModelFromJson(json);

  ProjectFeatureItem toEntity() => ProjectFeatureItem(icon: icon, title: title, description: description);
}

@freezed
abstract class ProjectImageSizeModel with _$ProjectImageSizeModel {
  const factory ProjectImageSizeModel({required String url, required String alt}) = _ProjectImageSizeModel;

  const ProjectImageSizeModel._();

  factory ProjectImageSizeModel.fromJson(Map<String, dynamic> json) => _$ProjectImageSizeModelFromJson(json);

  ProjectImageSize toEntity() => ProjectImageSize(url: url, alt: alt);
}

@freezed
abstract class ProjectImageModel with _$ProjectImageModel {
  const factory ProjectImageModel({required ProjectImageSizeModel medium, required ProjectImageSizeModel raw}) =
      _ProjectImageModel;

  const ProjectImageModel._();

  factory ProjectImageModel.fromJson(Map<String, dynamic> json) => _$ProjectImageModelFromJson(json);

  ProjectImageEntity toEntity() => ProjectImageEntity(medium: medium.toEntity(), raw: raw.toEntity());
}

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required int id,
    required String slug,
    required String title,
    required String description,
    required String category,
    required String categoryLabel,
    required String? caseStudyNumber,
    required List<String> techIcons,
    required List<TechStackItemModel> techStack,
    required List<ProjectFeatureItemModel> features,
    required bool isFeatured,
    required int userId,
    required String status,
    required ProjectImageModel? image,
    required String createdAt,
    required String updatedAt,
  }) = _ProjectModel;

  const ProjectModel._();

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      slug: slug,
      title: title,
      description: description,
      category: category,
      categoryLabel: categoryLabel,
      caseStudyNumber: caseStudyNumber,
      techIcons: techIcons,
      techStack: techStack.map((e) => e.toEntity()).toList(),
      features: features.map((e) => e.toEntity()).toList(),
      isFeatured: isFeatured,
      userId: userId,
      status: status,
      image: image?.toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
