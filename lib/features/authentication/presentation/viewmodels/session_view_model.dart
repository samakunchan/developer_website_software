import 'package:developer_website_software/features/authentication/domain/entities/session_entity.dart';
import 'package:developer_website_software/features/authentication/presentation/viewmodels/user_view_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SessionViewModel {
  SessionViewModel(SessionEntity entity)
    : _entity = entity,
      tokenSignal = signal(entity.token),
      userSignal = signal(UserViewModel(entity.user));

  SessionEntity _entity;
  SessionEntity get entity => _entity;

  final Signal<String> tokenSignal;
  final Signal<UserViewModel> userSignal;

  void updateFromEntity(SessionEntity newEntity) {
    _entity = newEntity;
    tokenSignal.value = newEntity.token;
    userSignal.value = UserViewModel(newEntity.user);
  }

  String get token => tokenSignal.value;
  UserViewModel get user => userSignal.value;
}
