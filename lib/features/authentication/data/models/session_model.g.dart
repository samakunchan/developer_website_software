// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => _SessionModel(
  token: json['token'] as String,
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SessionModelToJson(_SessionModel instance) => <String, dynamic>{
  'token': instance.token,
  'user': instance.user,
};
