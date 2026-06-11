import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/authentication/domain/entities/session_entity.dart';
import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/domain/usecases/get_session_use_case.dart';
import 'package:developer_website_software/features/authentication/domain/usecases/sign_in_use_case.dart';
import 'package:developer_website_software/features/authentication/domain/usecases/sign_out_use_case.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AuthSignals {
  AuthSignals({
    required this.signInUseCase,
    required this.signOutUseCase,
    required this.getSessionUseCase,
  });

  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetSessionUseCase getSessionUseCase;

  /// Reactive State Signals
  final Signal<UserEntity?> currentUser = signal<UserEntity?>(null);
  final Signal<bool> isLoading = signal<bool>(false);
  final Signal<String?> authError = signal<String?>(null);

  Future<void> signIn(String email, String password) async {
    isLoading.value = true;
    authError.value = null;

    final Either<Failure, SessionEntity> result = await signInUseCase(
      SignInParams(email: email, password: password),
    );

    result.fold(
      (Failure failure) {
        authError.value = failure.message;
        currentUser.value = null;
      },
      (SessionEntity session) {
        currentUser.value = session.user;
        authError.value = null;
      },
    );

    isLoading.value = false;
  }

  Future<void> signOut() async {
    isLoading.value = true;
    authError.value = null;

    final Either<Failure, Unit> result = await signOutUseCase();

    result.fold(
      (Failure failure) {
        currentUser.value = null;
        authError.value = failure.message;
      },
      (_) {
        currentUser.value = null;
        authError.value = null;
      },
    );

    isLoading.value = false;
  }

  Future<void> checkSession() async {
    isLoading.value = true;

    final Either<Failure, UserEntity> result = await getSessionUseCase();

    result.fold(
      (Failure failure) => currentUser.value = null,
      (UserEntity user) => currentUser.value = user,
    );

    isLoading.value = false;
  }
}
