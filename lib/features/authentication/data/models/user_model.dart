import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  @Assert('id > 0', 'ID must be a positive integer')
  @Assert('email.contains("@")', 'Email address is invalid')
  @Assert('role.contains("admin")', 'The role should be an admin.')
  factory UserModel({
    required int id,
    required String name,
    required String email,
    required String role,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(id: id, name: name, email: email, role: role);
}
