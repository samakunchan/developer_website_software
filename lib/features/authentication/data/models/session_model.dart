import 'package:developer_website_software/features/authentication/data/models/user_model.dart';
import 'package:developer_website_software/features/authentication/domain/entities/session_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
abstract class SessionModel with _$SessionModel {
  const factory SessionModel({
    required String token,
    required UserModel user,
  }) = _SessionModel;

  const SessionModel._();

  factory SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

  SessionEntity toEntity() {
    return SessionEntity(
      token: token,
      user: user.toEntity(),
    );
  }
}
