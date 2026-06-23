import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:signals_flutter/signals_flutter.dart';

class UserViewModel {
  UserViewModel(UserEntity entity)
    : _entity = entity,
      nameSignal = signal(entity.name),
      emailSignal = signal(entity.email),
      roleSignal = signal(entity.role);

  UserEntity _entity;
  UserEntity get entity => _entity;

  final Signal<String> nameSignal;
  final Signal<String> emailSignal;
  final Signal<String> roleSignal;

  void updateFromEntity(UserEntity newEntity) {
    _entity = newEntity;
    nameSignal.value = newEntity.name;
    emailSignal.value = newEntity.email;
    roleSignal.value = newEntity.role;
  }

  int get id => _entity.id;
  String get name => nameSignal.value;
  String get email => emailSignal.value;
  String get role => roleSignal.value;
}
