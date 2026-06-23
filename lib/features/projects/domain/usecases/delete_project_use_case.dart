import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/projects/domain/repositories/projects_repository.dart';

class DeleteProjectUseCase {
  const DeleteProjectUseCase(this.repository);

  final ProjectsRepository repository;

  Future<Either<Failure, void>> call(int id) {
    return repository.deleteProject(id);
  }
}
