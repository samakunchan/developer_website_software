import 'package:developer_website_software/features/settings_app/domain/entities/policy_entity.dart';

class PolicyModel extends PolicyEntity {
  const PolicyModel({
    required super.id,
    required super.title,
    required super.content,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PolicyModel.fromJson(Map<String, dynamic> json) {
    return PolicyModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'title': title, 'content': content, 'createdAt': createdAt, 'updatedAt': updatedAt};
  }

  PolicyEntity toEntity() {
    return PolicyEntity(id: id, title: title, content: content, createdAt: createdAt, updatedAt: updatedAt);
  }
}
