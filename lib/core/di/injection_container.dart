import 'package:developer_website_software/core/network/api_service_impl.dart';
import 'package:developer_website_software/features/authentication/data/datasources/auth_cache_data_source.dart';
import 'package:developer_website_software/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:developer_website_software/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:developer_website_software/features/authentication/domain/repositories/auth_repository.dart';
import 'package:developer_website_software/features/authentication/domain/usecases/get_session_use_case.dart';
import 'package:developer_website_software/features/authentication/domain/usecases/sign_in_use_case.dart';
import 'package:developer_website_software/features/authentication/domain/usecases/sign_out_use_case.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/projects/data/datasources/projects_remote_data_source.dart';
import 'package:developer_website_software/features/projects/data/repositories/projects_repository_impl.dart';
import 'package:developer_website_software/features/projects/domain/repositories/projects_repository.dart';
import 'package:developer_website_software/features/projects/domain/usecases/create_project_use_case.dart';
import 'package:developer_website_software/features/projects/domain/usecases/delete_project_use_case.dart';
import 'package:developer_website_software/features/projects/domain/usecases/get_projects_use_case.dart';
import 'package:developer_website_software/features/projects/domain/usecases/toggle_project_featured_use_case.dart';
import 'package:developer_website_software/features/projects/domain/usecases/update_project_use_case.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/settings_app/data/datasources/settings_app_remote_data_source.dart';
import 'package:developer_website_software/features/settings_app/data/repositories/settings_app_repository_impl.dart';
import 'package:developer_website_software/features/settings_app/domain/repositories/settings_app_repository.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/get_policy_use_case.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/get_theme_use_case.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/set_theme_use_case.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/update_policy_use_case.dart';
import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt kGetIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  /// Core External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  /// Register with cascades to avoid receiver duplication warnings
  kGetIt
    ..registerSingleton<SharedPreferences>(sharedPreferences)
    ..registerSingleton<PackageInfo>(packageInfo)
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
    )
    /// Core Settings
    ..registerSingleton<SettingsSoftSignals>(
      SettingsSoftSignals(kGetIt<SharedPreferences>()),
    )
    /// Features - Settings App - Data Layer
    ..registerLazySingleton<SettingsAppRemoteDataSource>(() => SettingsAppRemoteDataSourceImpl(kGetIt<ApiService>()))
    ..registerLazySingleton<SettingsAppRepository>(
      () => SettingsAppRepositoryImpl(remoteDataSource: kGetIt<SettingsAppRemoteDataSource>()),
    )
    /// Features - Settings App - Domain Layer
    ..registerLazySingleton<GetThemeUseCase>(() => GetThemeUseCase(kGetIt<SettingsAppRepository>()))
    ..registerLazySingleton<SetThemeUseCase>(() => SetThemeUseCase(kGetIt<SettingsAppRepository>()))
    ..registerLazySingleton<GetPolicyUseCase>(() => GetPolicyUseCase(kGetIt<SettingsAppRepository>()))
    ..registerLazySingleton<UpdatePolicyUseCase>(() => UpdatePolicyUseCase(kGetIt<SettingsAppRepository>()))
    /// Features - Settings App - Presentation Layer Signals
    ..registerLazySingleton<SettingsAppSignals>(
      () => SettingsAppSignals(
        getThemeUseCase: kGetIt<GetThemeUseCase>(),
        setThemeUseCase: kGetIt<SetThemeUseCase>(),
        getPolicyUseCase: kGetIt<GetPolicyUseCase>(),
        updatePolicyUseCase: kGetIt<UpdatePolicyUseCase>()
      )
    )
    /// Features - Projects - Data Layer
    ..registerLazySingleton<ProjectsRemoteDataSource>(() => ProjectsRemoteDataSourceImpl(kGetIt<ApiService>()))
    ..registerLazySingleton<ProjectsRepository>(
      () => ProjectsRepositoryImpl(remoteDataSource: kGetIt<ProjectsRemoteDataSource>())
    )
    /// Features - Projects - Domain Layer
    ..registerLazySingleton<GetProjectsUseCase>(() => GetProjectsUseCase(kGetIt<ProjectsRepository>()))
    ..registerLazySingleton<ToggleProjectFeaturedUseCase>(() => ToggleProjectFeaturedUseCase(kGetIt<ProjectsRepository>()))
    ..registerLazySingleton<CreateProjectUseCase>(() => CreateProjectUseCase(kGetIt<ProjectsRepository>()))
    ..registerLazySingleton<UpdateProjectUseCase>(() => UpdateProjectUseCase(kGetIt<ProjectsRepository>()))
    ..registerLazySingleton<DeleteProjectUseCase>(() => DeleteProjectUseCase(kGetIt<ProjectsRepository>()))
    /// Features - Projects - Presentation Layer Signals
    ..registerLazySingleton<ProjectsSignals>(
      () => ProjectsSignals(
        getProjectsUseCase: kGetIt<GetProjectsUseCase>(),
        toggleProjectFeaturedUseCase: kGetIt<ToggleProjectFeaturedUseCase>(),
        createProjectUseCase: kGetIt<CreateProjectUseCase>(),
        updateProjectUseCase: kGetIt<UpdateProjectUseCase>(),
        deleteProjectUseCase: kGetIt<DeleteProjectUseCase>()
      )
    );
}
