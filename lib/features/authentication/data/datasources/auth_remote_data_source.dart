import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/network/api_config.dart';
import 'package:developer_website_software/core/network/api_service_impl.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:developer_website_software/features/authentication/data/models/session_model.dart';
import 'package:developer_website_software/features/authentication/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<SessionModel> signIn({required String email, required String password});

  Future<void> signOut();

  Future<UserModel> getSession();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<SessionModel> signIn({required String email, required String password}) async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.post<Map<String, dynamic>>(
      path: ApiConfig.postSignIn,
      data: <String, dynamic>{
        'email': email,
        'password': password,
      },
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      SessionModel.fromJson,
    );
  }

  @override
  Future<void> signOut() async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.post<Map<String, dynamic>>(
      path: ApiConfig.postSignOut,
    );

    result.fold(
      (ExceptionModel exception) => throw exception,
      (_) {},
    );
  }

  @override
  Future<UserModel> getSession() async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.get<Map<String, dynamic>>(
      path: ApiConfig.getSession,
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      (Map<String, dynamic> data) {
        final userJson = data['user'] as Map<String, dynamic>;

        return UserModel.fromJson(userJson);
      },
    );
  }
}
