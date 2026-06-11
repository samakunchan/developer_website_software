import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  const SessionEntity({
    required this.token,
    required this.user,
  });

  final String token;
  final UserEntity user;

  @override
  List<Object?> get props => [token, user];
}
