import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/messages/domain/entities/message_entity.dart';

abstract class MessagesRepository {
  Future<Either<Failure, PaginatedMessages>> getMessages(GetMessagesParams params);

  Future<Either<Failure, int>> getUnreadMessagesCount();

  Future<Either<Failure, MessageEntity>> toggleMessageRead(int id, {required bool isRead});
}
