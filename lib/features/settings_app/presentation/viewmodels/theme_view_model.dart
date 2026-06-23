import 'package:developer_website_software/features/settings_app/domain/entities/theme_entity.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ThemeViewModel {
  ThemeViewModel(ThemeEntity entity)
    : _entity = entity,
      theme = signal(entity.theme);

  ThemeEntity _entity;
  ThemeEntity get entity => _entity;

  final Signal<String> theme;

  void updateFromEntity(ThemeEntity newEntity) {
    _entity = newEntity;
    theme.value = newEntity.theme;
  }
}
