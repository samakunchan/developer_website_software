import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/messages/domain/entities/message_entity.dart';
import 'package:developer_website_software/features/messages/domain/repositories/messages_repository.dart';

class ToggleMessageReadUseCase {
  const ToggleMessageReadUseCase(this.repository);

  final MessagesRepository repository;

  Future<Either<Failure, MessageEntity>> call(int id, {required bool isRead}) {
    return repository.toggleMessageRead(id, isRead: isRead);
  }
}
