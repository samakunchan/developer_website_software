import 'package:equatable/equatable.dart';

class TechStackItem extends Equatable {
  const TechStackItem({required this.name, required this.icon});

  final String name;
  final String icon;

  @override
  List<Object?> get props => [name, icon];
}

class ProjectFeatureItem extends Equatable {
  const ProjectFeatureItem({required this.icon, required this.title, required this.description});

  final String icon;
  final String title;
  final String description;

  @override
  List<Object?> get props => [icon, title, description];
}

class ProjectImageSize extends Equatable {
  const ProjectImageSize({required this.url, required this.alt});

  final String url;
  final String alt;

  @override
  List<Object?> get props => [url, alt];
}

class ProjectImageEntity extends Equatable {
  const ProjectImageEntity({required this.medium, required this.raw});

  final ProjectImageSize medium;
  final ProjectImageSize raw;

  @override
  List<Object?> get props => [medium, raw];
}

class ProjectEntity extends Equatable {
  const ProjectEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.category,
    required this.categoryLabel,
    required this.caseStudyNumber,
    required this.techIcons,
    required this.techStack,
    required this.features,
    required this.isFeatured,
    required this.userId,
    required this.status,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String slug;
  final String title;
  final String description;
  final String category;
  final String categoryLabel;
  final String? caseStudyNumber;
  final List<String> techIcons;
  final List<TechStackItem> techStack;
  final List<ProjectFeatureItem> features;
  final bool isFeatured;
  final int userId;
  final String status;
  final ProjectImageEntity? image;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [
    id,
    slug,
    title,
    description,
    category,
    categoryLabel,
    caseStudyNumber,
    techIcons,
    techStack,
    features,
    isFeatured,
    userId,
    status,
    image,
    createdAt,
    updatedAt,
  ];
}

class UpdateProjectParams extends Equatable {
  const UpdateProjectParams({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.category,
    required this.categoryLabel,
    required this.status,
    required this.isFeatured,
    this.caseStudyNumber,
    this.techIcons,
    this.techStack,
    this.features
  });

  final int id;
  final String slug;
  final String title;
  final String description;
  final String category;
  final String categoryLabel;
  final String? caseStudyNumber;
  final String status;
  final bool isFeatured;
  final List<String>? techIcons;
  final List<TechStackItem>? techStack;
  final List<ProjectFeatureItem>? features;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'slug': slug,
      'title': title,
      'description': description,
      'category': category,
      'categoryLabel': categoryLabel,
      'caseStudyNumber': caseStudyNumber,
      'status': status,
      'isFeatured': isFeatured,
      if (techIcons != null) 'techIcons': techIcons,
      if (techStack != null) 'techStack': techStack!.map((e) => <String, String>{'name': e.name, 'icon': e.icon}).toList(),
      if (features != null) 'features': features!.map((e) => <String, String>{'icon': e.icon, 'title': e.title, 'description': e.description}).toList()
    };
  }

  @override
  List<Object?> get props => [
    id,
    slug,
    title,
    description,
    category,
    categoryLabel,
    caseStudyNumber,
    status,
    isFeatured,
    techIcons,
    techStack,
    features
  ];
}

class CreateProjectParams extends Equatable {
  const CreateProjectParams({
    required this.slug,
    required this.title,
    required this.description,
    required this.category,
    required this.categoryLabel,
    this.caseStudyNumber,
    this.techIcons = const [],
    this.techStack = const [],
    this.features = const [],
    this.isFeatured = false,
    this.status = 'draft'
  });

  final String slug;
  final String title;
  final String description;
  final String category;
  final String categoryLabel;
  final String? caseStudyNumber;
  final List<String> techIcons;
  final List<TechStackItem> techStack;
  final List<ProjectFeatureItem> features;
  final bool isFeatured;
  final String status;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'slug': slug,
      'title': title,
      'description': description,
      'category': category,
      'categoryLabel': categoryLabel,
      'caseStudyNumber': caseStudyNumber,
      'techIcons': techIcons,
      'techStack': techStack.map((e) => <String, String>{'name': e.name, 'icon': e.icon}).toList(),
      'features': features.map((e) => <String, String>{'icon': e.icon, 'title': e.title, 'description': e.description}).toList(),
      'isFeatured': isFeatured,
      'status': status
    };
  }

  @override
  List<Object?> get props => [
    slug,
    title,
    description,
    category,
    categoryLabel,
    caseStudyNumber,
    techIcons,
    techStack,
    features,
    isFeatured,
    status
  ];
}
