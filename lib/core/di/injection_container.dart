import 'package:developer_website_software/core/network/api_service_impl.dart';
import 'package:developer_website_software/features/authentication/data/datasources/auth_cache_data_source.dart';
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
    ..registerLazySingleton<ApiService>(ApiServiceImpl.new)
    /// Features - Authentication - Data Sources
    ..registerLazySingleton<AuthCacheDataSource>(() => AuthCacheDataSourceImpl(kGetIt<SharedPreferences>()))
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(kGetIt<ApiService>()))
    /// Features - Authentication - Repository
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: kGetIt<AuthRemoteDataSource>(),
        cacheDataSource: kGetIt<AuthCacheDataSource>(),
      ),
    )
    /// Features - Authentication - Use Cases
    ..registerLazySingleton<SignInUseCase>(() => SignInUseCase(kGetIt<AuthRepository>()))
    ..registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(kGetIt<AuthRepository>()))
    ..registerLazySingleton<GetSessionUseCase>(() => GetSessionUseCase(kGetIt<AuthRepository>()))
    /// Features - Authentication - Presentation State
    ..registerLazySingleton<AuthSignals>(
      () => AuthSignals(
        signInUseCase: kGetIt<SignInUseCase>(),
        signOutUseCase: kGetIt<SignOutUseCase>(),
        getSessionUseCase: kGetIt<GetSessionUseCase>(),
      ),
    );
}
