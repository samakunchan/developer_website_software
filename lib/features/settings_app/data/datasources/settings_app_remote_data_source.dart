import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/network/api_config.dart';
import 'package:developer_website_software/core/network/api_service_impl.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:developer_website_software/features/settings_app/data/models/theme_model.dart';

abstract class SettingsAppRemoteDataSource {
  Future<ThemeModel> getTheme();

  Future<ThemeModel> setTheme(String theme);
}

class SettingsAppRemoteDataSourceImpl implements SettingsAppRemoteDataSource {
  SettingsAppRemoteDataSourceImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<ThemeModel> getTheme() async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.get<Map<String, dynamic>>(
      path: ApiConfig.getTheme,
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      ThemeModel.fromJson,
    );
  }

  @override
  Future<ThemeModel> setTheme(String theme) async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.put<Map<String, dynamic>>(
      path: ApiConfig.putTheme,
      data: <String, dynamic>{
        'theme': theme,
      },
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      ThemeModel.fromJson,
    );
  }
}
