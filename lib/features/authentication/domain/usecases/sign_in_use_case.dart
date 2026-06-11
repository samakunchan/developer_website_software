import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/authentication/domain/entities/session_entity.dart';
import 'package:developer_website_software/features/authentication/domain/repositories/auth_repository.dart';

class SignInParams {
  const SignInParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class SignInUseCase {
  const SignInUseCase(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, SessionEntity>> call(SignInParams params) {
    return repository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}
