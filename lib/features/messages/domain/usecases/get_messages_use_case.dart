import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/messages/domain/entities/message_entity.dart';
import 'package:developer_website_software/features/messages/domain/repositories/messages_repository.dart';

class GetMessagesUseCase {
  const GetMessagesUseCase(this.repository);

  final MessagesRepository repository;

  Future<Either<Failure, PaginatedMessages>> call(GetMessagesParams params) {
    return repository.getMessages(params);
  }
}
