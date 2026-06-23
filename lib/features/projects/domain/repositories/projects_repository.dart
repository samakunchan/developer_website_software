import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';

abstract class ProjectsRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjects();

  Future<Either<Failure, ProjectEntity>> toggleProjectFeatured(int id);

  Future<Either<Failure, ProjectEntity>> createProject(CreateProjectParams params);

  Future<Either<Failure, ProjectEntity>> updateProject(UpdateProjectParams params);

  Future<Either<Failure, void>> deleteProject(int id);
}
