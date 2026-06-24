import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:developer_website_software/features/messages/data/datasources/messages_remote_data_source.dart';
import 'package:developer_website_software/features/messages/data/models/message_model.dart';
import 'package:developer_website_software/features/messages/domain/entities/message_entity.dart';
import 'package:developer_website_software/features/messages/domain/repositories/messages_repository.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  MessagesRepositoryImpl({required this.remoteDataSource});

  final MessagesRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, PaginatedMessages>> getMessages(GetMessagesParams params) async {
    try {
      final PaginatedMessagesModel model = await remoteDataSource.getMessages(params);
      return Right(model.toEntity());
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500, exceptionName: 'UNKNOWN_ERROR'));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadMessagesCount() async {
    try {
      final int count = await remoteDataSource.getUnreadMessagesCount();
      return Right(count);
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500, exceptionName: 'UNKNOWN_ERROR'));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> toggleMessageRead(int id, {required bool isRead}) async {
    try {
      final MessageModel model = await remoteDataSource.toggleMessageRead(id, isRead: isRead);
      return Right(model.toEntity());
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500, exceptionName: 'UNKNOWN_ERROR'));
    }
  }
}
