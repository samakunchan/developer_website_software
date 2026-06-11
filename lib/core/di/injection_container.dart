import 'package:developer_website_software/core/network/api_service.dart';
import 'package:developer_website_software/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:developer_website_software/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:developer_website_software/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:developer_website_software/features/authentication/domain/repositories/auth_repository.dart';
import 'package:developer_website_software/features/authentication/domain/usecases/get_session_use_case.dart';
import 'package:developer_website_software/features/authentication/domain/usecases/sign_in_use_case.dart';
import 'package:developer_website_software/features/authentication/domain/usecases/sign_out_use_case.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt kGetIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  /// Core External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  /// Register with cascades to avoid receiver duplication warnings
  kGetIt
    ..registerSingleton<SharedPreferences>(sharedPreferences)
    /// Core Services
    ..registerLazySingleton<ApiService>(ApiService.new)
    /// Features - Authentication - Data Sources
    ..registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(kGetIt()))
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(kGetIt()))
    /// Features - Authentication - Repository
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: kGetIt(),
        localDataSource: kGetIt(),
      ),
    )
    /// Features - Authentication - Use Cases
    ..registerLazySingleton<SignInUseCase>(() => SignInUseCase(kGetIt()))
    ..registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(kGetIt()))
    ..registerLazySingleton<GetSessionUseCase>(() => GetSessionUseCase(kGetIt()))
    /// Features - Authentication - Presentation State
    ..registerLazySingleton<AuthSignals>(
      () => AuthSignals(
        signInUseCase: kGetIt(),
        signOutUseCase: kGetIt(),
        getSessionUseCase: kGetIt(),
      ),
    );
}
