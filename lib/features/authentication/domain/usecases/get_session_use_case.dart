import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/domain/repositories/auth_repository.dart';

class GetSessionUseCase {
  const GetSessionUseCase(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, UserEntity>> call() {
    return repository.getSession();
  }
}
