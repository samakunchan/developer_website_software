import 'package:developer_website_software/features/settings_app/domain/entities/theme_entity.dart';

class ThemeModel extends ThemeEntity {
  const ThemeModel({required super.theme});

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      theme: json['theme'] as String,
    );
  }

  ThemeEntity toEntity() => ThemeEntity(theme: theme);
}
