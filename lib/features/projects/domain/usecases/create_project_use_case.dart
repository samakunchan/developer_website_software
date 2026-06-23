import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/domain/repositories/projects_repository.dart';

class CreateProjectUseCase {
  const CreateProjectUseCase(this.repository);

  final ProjectsRepository repository;

  Future<Either<Failure, ProjectEntity>> call(CreateProjectParams params) {
    return repository.createProject(params);
  }
}
