import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/network/base_service.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ApiService {
  Future<Either<ExceptionModel, T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<Either<ExceptionModel, T>> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<Either<ExceptionModel, T>> put<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<Either<ExceptionModel, T>> delete<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });
}

class ApiServiceImpl extends BaseService implements ApiService {
  ApiServiceImpl() : super() {
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final String? token = prefs.getString('auth_token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );
  }

  @override
  Future<Either<ExceptionModel, T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return apiCall<T>(() async {
      final Response<dynamic> response = await client.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data as T;
    });
  }

  @override
  Future<Either<ExceptionModel, T>> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return apiCall<T>(() async {
      final Response<dynamic> response = await client.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data as T;
    });
  }

  @override
  Future<Either<ExceptionModel, T>> put<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return apiCall<T>(() async {
      final Response<dynamic> response = await client.put<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data as T;
    });
  }

  @override
  Future<Either<ExceptionModel, T>> delete<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return apiCall<T>(() async {
      final Response<dynamic> response = await client.delete<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data as T;
    });
  }
}
