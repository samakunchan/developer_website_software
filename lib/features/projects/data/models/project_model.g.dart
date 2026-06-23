// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TechStackItemModel _$TechStackItemModelFromJson(Map<String, dynamic> json) =>
    _TechStackItemModel(
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$TechStackItemModelToJson(_TechStackItemModel instance) =>
    <String, dynamic>{'name': instance.name, 'icon': instance.icon};

_ProjectFeatureItemModel _$ProjectFeatureItemModelFromJson(
  Map<String, dynamic> json,
) => _ProjectFeatureItemModel(
  icon: json['icon'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$ProjectFeatureItemModelToJson(
  _ProjectFeatureItemModel instance,
) => <String, dynamic>{
  'icon': instance.icon,
  'title': instance.title,
  'description': instance.description,
};

_ProjectImageSizeModel _$ProjectImageSizeModelFromJson(
  Map<String, dynamic> json,
) => _ProjectImageSizeModel(
  url: json['url'] as String,
  alt: json['alt'] as String,
);

Map<String, dynamic> _$ProjectImageSizeModelToJson(
  _ProjectImageSizeModel instance,
) => <String, dynamic>{'url': instance.url, 'alt': instance.alt};

_ProjectImageModel _$ProjectImageModelFromJson(Map<String, dynamic> json) =>
    _ProjectImageModel(
      medium: ProjectImageSizeModel.fromJson(
        json['medium'] as Map<String, dynamic>,
      ),
      raw: ProjectImageSizeModel.fromJson(json['raw'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectImageModelToJson(_ProjectImageModel instance) =>
    <String, dynamic>{'medium': instance.medium, 'raw': instance.raw};

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    _ProjectModel(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      categoryLabel: json['categoryLabel'] as String,
      caseStudyNumber: json['caseStudyNumber'] as String?,
      techIcons: (json['techIcons'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      techStack: (json['techStack'] as List<dynamic>)
          .map((e) => TechStackItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>)
          .map(
            (e) => ProjectFeatureItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      isFeatured: json['isFeatured'] as bool,
      userId: (json['userId'] as num).toInt(),
      status: json['status'] as String,
      image: json['image'] == null
          ? null
          : ProjectImageModel.fromJson(json['image'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'categoryLabel': instance.categoryLabel,
      'caseStudyNumber': instance.caseStudyNumber,
      'techIcons': instance.techIcons,
      'techStack': instance.techStack,
      'features': instance.features,
      'isFeatured': instance.isFeatured,
      'userId': instance.userId,
      'status': instance.status,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
