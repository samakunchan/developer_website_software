import 'package:dio/dio.dart';

class ExceptionModel implements Exception {
  const ExceptionModel({
    required this.message,
    required this.exceptionName,
    required this.statusCode,
  });

  factory ExceptionModel.fromJson(Map<String, dynamic> json) {
    final dynamic msg = json['message'] ?? json['exceptionName'] ?? 'Unknown error occurred';
    final String parsedMessage = msg is List ? msg.join(', ') : msg.toString();

    final String parsedExceptionName = (json['exceptionName'] ?? json['error'] ?? 'EXCEPTION_UNKNOWN').toString();
    final int status = int.tryParse(json['statusCode']?.toString() ?? '') ?? 500;

    return ExceptionModel(
      message: parsedMessage,
      exceptionName: parsedExceptionName,
      statusCode: status,
    );
  }

  factory ExceptionModel.fromDioException(DioException e) {
    if (e.response != null && e.response?.data is Map<String, dynamic>) {
      try {
        return ExceptionModel.fromJson(e.response!.data as Map<String, dynamic>);
      } on Object catch (_) {
        return ExceptionModel(
          message: e.response?.statusMessage ?? 'Response error',
          exceptionName: 'DIO_RESPONSE_ERROR',
          statusCode: e.response?.statusCode ?? 500,
        );
      }
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ExceptionModel(
          message: 'Connection timeout',
          exceptionName: 'CONNECTION_TIMEOUT',
          statusCode: 408,
        );
      case DioExceptionType.receiveTimeout:
        return const ExceptionModel(
          message: 'Receive timeout',
          exceptionName: 'RECEIVE_TIMEOUT',
          statusCode: 408,
        );
      case DioExceptionType.sendTimeout:
        return const ExceptionModel(
          message: 'Send timeout',
          exceptionName: 'SEND_TIMEOUT',
          statusCode: 408,
        );
      case DioExceptionType.cancel:
        return const ExceptionModel(
          message: 'Request cancelled',
          exceptionName: 'REQUEST_CANCELLED',
          statusCode: 499,
        );
      case DioExceptionType.connectionError:
        return const ExceptionModel(
          message: 'No internet connection',
          exceptionName: 'CONNECTION_ERROR',
          statusCode: 503,
        );
      case DioExceptionType.badCertificate:
        return ExceptionModel(
          message: e.message ?? 'Bad certificate',
          exceptionName: 'BAD_CERTIFICATE',
          statusCode: 500,
        );
      case DioExceptionType.badResponse:
        return ExceptionModel(
          message: e.message ?? 'Bad response',
          exceptionName: 'BAD_RESPONSE',
          statusCode: e.response?.statusCode ?? 500,
        );
      case DioExceptionType.unknown:
        return ExceptionModel(
          message: e.message ?? 'Unknown network error',
          exceptionName: 'NETWORK_ERROR',
          statusCode: 500,
        );
    }
  }

  final String message;
  final String exceptionName;
  final int statusCode;

  @override
  String toString() => 'ExceptionModel(message: $message, exceptionName: $exceptionName, statusCode: $statusCode)';
}
