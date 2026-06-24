import 'package:developer_website_software/features/settings_app/domain/entities/theme_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_model.freezed.dart';
part 'theme_model.g.dart';

@freezed
abstract class ThemeModel with _$ThemeModel {
  @Assert('["dark", "light", "forest", "ocean", "desert"].contains(theme)', 'This theme is not validated.')
  factory ThemeModel({required String theme}) = _ThemeModel;

  const ThemeModel._();

  factory ThemeModel.fromJson(Map<String, dynamic> json) => _$ThemeModelFromJson(json);

  ThemeEntity toEntity() => ThemeEntity(theme: theme);
}
