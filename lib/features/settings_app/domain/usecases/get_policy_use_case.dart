import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/settings_app/domain/entities/policy_entity.dart';
import 'package:developer_website_software/features/settings_app/domain/repositories/settings_app_repository.dart';

class GetPolicyUseCase {
  GetPolicyUseCase(this.repository);

  final SettingsAppRepository repository;

  Future<Either<Failure, PolicyEntity>> call(String type) => repository.getPolicy(type);
}
