import 'package:dio/dio.dart';

class ExceptionModel implements Exception {
  const ExceptionModel({
    required this.message,
    required this.exception,
    required this.statusCode,
  });

  factory ExceptionModel.fromJson(Map<String, dynamic> json) {
    final dynamic msg = json['message'] ?? json['exceptionName'] ?? 'Unknown error occurred';
    final String parsedMessage = msg is List ? msg.join(', ') : msg.toString();
    
    final String exceptionName = (json['exceptionName'] ?? json['error'] ?? 'EXCEPTION_UNKNOWN').toString();
    final int status = (json['statusCode'] as num?)?.toInt() ?? 500;

    return ExceptionModel(
      message: parsedMessage,
      exception: exceptionName,
      statusCode: status,
    );
  }

  factory ExceptionModel.fromDioException(DioException e) {
    if (e.response != null && e.response?.data is Map<String, dynamic>) {
      try {
        return ExceptionModel.fromJson(e.response!.data as Map<String, dynamic>);
      } on Exception catch (_) {
        return ExceptionModel(
          message: e.response?.statusMessage ?? 'Response error',
          exception: 'DIO_RESPONSE_ERROR',
          statusCode: e.response?.statusCode ?? 500,
        );
      }
    }
    
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ExceptionModel(
          message: 'Connection timeout',
          exception: 'CONNECTION_TIMEOUT',
          statusCode: 408,
        );
      case DioExceptionType.receiveTimeout:
        return const ExceptionModel(
          message: 'Receive timeout',
          exception: 'RECEIVE_TIMEOUT',
          statusCode: 408,
        );
      case DioExceptionType.sendTimeout:
        return const ExceptionModel(
          message: 'Send timeout',
          exception: 'SEND_TIMEOUT',
          statusCode: 408,
        );
      case DioExceptionType.cancel:
        return const ExceptionModel(
          message: 'Request cancelled',
          exception: 'REQUEST_CANCELLED',
          statusCode: 499,
        );
      case DioExceptionType.connectionError:
        return const ExceptionModel(
          message: 'No internet connection',
          exception: 'CONNECTION_ERROR',
          statusCode: 503,
        );
      case DioExceptionType.badCertificate:
        return ExceptionModel(
          message: e.message ?? 'Bad certificate',
          exception: 'BAD_CERTIFICATE',
          statusCode: 500,
        );
      case DioExceptionType.badResponse:
        return ExceptionModel(
          message: e.message ?? 'Bad response',
          exception: 'BAD_RESPONSE',
          statusCode: e.response?.statusCode ?? 500,
        );
      case DioExceptionType.unknown:
        return ExceptionModel(
          message: e.message ?? 'Unknown network error',
          exception: 'NETWORK_ERROR',
          statusCode: 500,
        );
    }
  }

  final String message;
  final String exception;
  final int statusCode;

  @override
  String toString() => 'ExceptionModel(message: $message, exception: $exception, statusCode: $statusCode)';
}
