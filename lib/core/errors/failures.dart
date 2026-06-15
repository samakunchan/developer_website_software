import 'package:developer_website_software/core/network/exception_model.dart';

abstract class Failure {
  const Failure(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

class ServerFailure extends Failure {
  const ServerFailure({
    required String message,
    required this.statusCode,
    required this.exceptionName,
  }) : super(message);

  factory ServerFailure.fromException(ExceptionModel model) {
    return ServerFailure(
      message: model.message,
      statusCode: model.statusCode,
      exceptionName: model.exceptionName,
    );
  }

  final int statusCode;
  final String exceptionName;
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([super.message = 'No Internet Connection']);
}
