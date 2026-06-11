import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/network/api_config.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class BaseService {
  BaseService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  late final Dio _dio;

  Dio get client => _dio;

  @protected
  Future<Either<ExceptionModel, T>> apiCall<T>(Future<T> Function() call) async {
    try {
      final T result = await call();
      
      return Right(result);
    } on DioException catch (e) {
      return Left(ExceptionModel.fromDioException(e));
    } on Exception catch (e) {
      return Left(
        ExceptionModel(
          message: e.toString(),
          exception: 'UNKNOWN_EXCEPTION',
          statusCode: 500,
        ),
      );
    }
  }
}
