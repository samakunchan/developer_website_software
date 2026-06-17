import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:developer_website_software/features/settings_app/data/datasources/settings_app_remote_data_source.dart';
import 'package:developer_website_software/features/settings_app/data/models/theme_model.dart';
import 'package:developer_website_software/features/settings_app/domain/entities/theme_entity.dart';
import 'package:developer_website_software/features/settings_app/domain/repositories/settings_app_repository.dart';

class SettingsAppRepositoryImpl implements SettingsAppRepository {
  SettingsAppRepositoryImpl({required this.remoteDataSource});

  final SettingsAppRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, ThemeEntity>> getTheme() async {
    try {
      final ThemeModel themeModel = await remoteDataSource.getTheme();

      return Right(themeModel.toEntity());
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
          statusCode: 500,
          exceptionName: 'UNKNOWN_ERROR',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ThemeEntity>> setTheme(String theme) async {
    try {
      final ThemeModel themeModel = await remoteDataSource.setTheme(theme);

      return Right(themeModel.toEntity());
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
          statusCode: 500,
          exceptionName: 'UNKNOWN_ERROR',
        ),
      );
    }
  }
}
