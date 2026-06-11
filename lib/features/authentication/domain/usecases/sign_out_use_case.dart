import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/authentication/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  const SignOutUseCase(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, Unit>> call() {
    return repository.signOut();
  }
}
