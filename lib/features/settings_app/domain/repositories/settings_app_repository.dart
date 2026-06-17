import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/settings_app/domain/entities/theme_entity.dart';

abstract class SettingsAppRepository {
  Future<Either<Failure, ThemeEntity>> getTheme();

  Future<Either<Failure, ThemeEntity>> setTheme(String theme);
}
