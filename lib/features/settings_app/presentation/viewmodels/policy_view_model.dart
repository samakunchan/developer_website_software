import 'package:developer_website_software/features/settings_app/domain/entities/policy_entity.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PolicyViewModel {
  PolicyViewModel(PolicyEntity entity)
    : _entity = entity,
      title = signal(entity.title),
      content = signal(entity.content);

  PolicyEntity _entity;
  PolicyEntity get entity => _entity;

  final Signal<String> title;
  final Signal<String> content;

  void updateFromEntity(PolicyEntity newEntity) {
    _entity = newEntity;
    title.value = newEntity.title;
    content.value = newEntity.content;
  }

  int get id => _entity.id;
  String get createdAt => _entity.createdAt;
  String get updatedAt => _entity.updatedAt;
}
