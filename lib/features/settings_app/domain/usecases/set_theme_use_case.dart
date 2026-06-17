import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/settings_app/domain/entities/theme_entity.dart';
import 'package:developer_website_software/features/settings_app/domain/repositories/settings_app_repository.dart';

class SetThemeUseCase {
  const SetThemeUseCase(this.repository);

  final SettingsAppRepository repository;

  Future<Either<Failure, ThemeEntity>> call(String theme) {
    return repository.setTheme(theme);
  }
}
