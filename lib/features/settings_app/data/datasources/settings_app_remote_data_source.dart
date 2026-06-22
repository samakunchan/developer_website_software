import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/network/api_config.dart';
import 'package:developer_website_software/core/network/api_service_impl.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:developer_website_software/features/settings_app/data/models/policy_model.dart';
import 'package:developer_website_software/features/settings_app/data/models/theme_model.dart';

abstract class SettingsAppRemoteDataSource {
  Future<ThemeModel> getTheme();

  Future<ThemeModel> setTheme(String theme);

  Future<PolicyModel> getPolicy(String type);

  Future<PolicyModel> updatePolicy(String type, String title, String content);
}

class SettingsAppRemoteDataSourceImpl implements SettingsAppRemoteDataSource {
  SettingsAppRemoteDataSourceImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<ThemeModel> getTheme() async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.get<Map<String, dynamic>>(
      path: ApiConfig.getTheme,
    );

    return result.fold((ExceptionModel exception) => throw exception, ThemeModel.fromJson);
  }

  @override
  Future<ThemeModel> setTheme(String theme) async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.put<Map<String, dynamic>>(
      path: ApiConfig.putTheme,
      data: <String, dynamic>{'theme': theme},
    );

    return result.fold((ExceptionModel exception) => throw exception, ThemeModel.fromJson);
  }

  @override
  Future<PolicyModel> getPolicy(String type) async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.get<Map<String, dynamic>>(
      path: '/settings/$type',
    );

    return result.fold((ExceptionModel exception) => throw exception, PolicyModel.fromJson);
  }

  @override
  Future<PolicyModel> updatePolicy(String type, String title, String content) async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.put<Map<String, dynamic>>(
      path: '/settings/$type',
      data: <String, dynamic>{'title': title, 'content': content},
    );

    return result.fold((ExceptionModel exception) => throw exception, PolicyModel.fromJson);
  }
}
