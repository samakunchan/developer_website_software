import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:developer_website_software/features/projects/data/datasources/projects_remote_data_source.dart';
import 'package:developer_website_software/features/projects/data/models/project_model.dart';
import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/domain/repositories/projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl({required this.remoteDataSource});

  final ProjectsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjects() async {
    try {
      final List<ProjectModel> models = await remoteDataSource.getProjects();
      final List<ProjectEntity> entities = models.map((ProjectModel model) => model.toEntity()).toList();
      return Right(entities);
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500, exceptionName: 'UNKNOWN_ERROR'));
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> toggleProjectFeatured(int id) async {
    try {
      final ProjectModel model = await remoteDataSource.toggleProjectFeatured(id);
      return Right(model.toEntity());
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500, exceptionName: 'UNKNOWN_ERROR'));
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> createProject(CreateProjectParams params) async {
    try {
      final ProjectModel model = await remoteDataSource.createProject(params);
      return Right(model.toEntity());
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500, exceptionName: 'UNKNOWN_ERROR'));
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> updateProject(UpdateProjectParams params) async {
    try {
      final ProjectModel model = await remoteDataSource.updateProject(params);
      return Right(model.toEntity());
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500, exceptionName: 'UNKNOWN_ERROR'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(int id) async {
    try {
      await remoteDataSource.deleteProject(id);
      return const Right(null);
    } on ExceptionModel catch (e) {
      return Left(ServerFailure.fromException(e));
    } on Object catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 500, exceptionName: 'UNKNOWN_ERROR'));
    }
  }
}
