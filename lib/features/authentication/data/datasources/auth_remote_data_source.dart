import 'package:developer_website_software/core/network/api_service.dart';
import 'package:developer_website_software/features/authentication/data/models/session_model.dart';
import 'package:developer_website_software/features/authentication/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<SessionModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserModel> getSession();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<SessionModel> signIn({
    required String email,
    required String password,
  }) async {
    final result = await apiService.post<Map<String, dynamic>>(
      path: '/auth/api/sign-in',
      data: {
        'email': email,
        'password': password,
      },
    );

    return result.fold(
      (exception) => throw exception,
      SessionModel.fromJson,
    );
  }

  @override
  Future<void> signOut() async {
    final result = await apiService.post<Map<String, dynamic>>(
      path: '/auth/api/sign-out',
    );

    result.fold(
      (exception) => throw exception,
      (_) {},
    );
  }

  @override
  Future<UserModel> getSession() async {
    final result = await apiService.get<Map<String, dynamic>>(
      path: '/auth/api/session',
    );

    return result.fold(
      (exception) => throw exception,
      (data) {
        final userJson = data['user'] as Map<String, dynamic>;
        
        return UserModel.fromJson(userJson);
      },
    );
  }
}
