import 'package:developer_website_software/features/settings_app/domain/entities/policy_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_model.freezed.dart';
part 'policy_model.g.dart';

@freezed
abstract class PolicyModel with _$PolicyModel {
  const factory PolicyModel({
    required int id,
    required String title,
    required String content,
    required String createdAt,
    required String updatedAt,
  }) = _PolicyModel;

  const PolicyModel._();

  factory PolicyModel.fromJson(Map<String, dynamic> json) => _$PolicyModelFromJson(json);

  PolicyEntity toEntity() => PolicyEntity(id: id, title: title, content: content, createdAt: createdAt, updatedAt: updatedAt);
}
