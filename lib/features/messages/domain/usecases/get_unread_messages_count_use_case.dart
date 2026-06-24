import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/messages/domain/repositories/messages_repository.dart';

class GetUnreadMessagesCountUseCase {
  const GetUnreadMessagesCountUseCase(this.repository);

  final MessagesRepository repository;

  Future<Either<Failure, int>> call() {
    return repository.getUnreadMessagesCount();
  }
}
