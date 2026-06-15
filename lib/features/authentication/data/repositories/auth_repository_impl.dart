import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:developer_website_software/features/authentication/data/datasources/auth_cache_data_source.dart';
import 'package:developer_website_software/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:developer_website_software/features/authentication/data/models/session_model.dart';
import 'package:developer_website_software/features/authentication/data/models/user_model.dart';
import 'package:developer_website_software/features/authentication/domain/entities/session_entity.dart';
import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.cacheDataSource,
  });

  final AuthRemoteDataSource remoteDataSource;
  final AuthCacheDataSource cacheDataSource;

  @override
  Future<Either<Failure, SessionEntity>> signIn({required String email, required String password}) async {
    try {
      final SessionModel sessionModel = await remoteDataSource.signIn(email: email, password: password);
      await cacheDataSource.saveToken(sessionModel.token);

      return Right(sessionModel.toEntity());
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
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await cacheDataSource.clearToken();

      return const Right(unit);
    } on ExceptionModel catch (e) {
      await cacheDataSource.clearToken();

      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      await cacheDataSource.clearToken();

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
  Future<Either<Failure, UserEntity>> getSession() async {
    try {
      final String? token = await cacheDataSource.getToken();
      if (token == null || token.isEmpty) {
        return const Left(CacheFailure('No authenticated session found in cache'));
      }

      final UserModel userModel = await remoteDataSource.getSession();

      return Right(userModel.toEntity());
    } on ExceptionModel catch (e) {
      await cacheDataSource.clearToken();
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
