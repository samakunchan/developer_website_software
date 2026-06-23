import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/network/api_config.dart';
import 'package:developer_website_software/core/network/api_service_impl.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:developer_website_software/features/projects/data/models/project_model.dart';
import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';

abstract class ProjectsRemoteDataSource {
  Future<List<ProjectModel>> getProjects();

  Future<ProjectModel> toggleProjectFeatured(int id);

  Future<ProjectModel> createProject(CreateProjectParams params);

  Future<ProjectModel> updateProject(UpdateProjectParams params);

  Future<void> deleteProject(int id);
}

class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  ProjectsRemoteDataSourceImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<List<ProjectModel>> getProjects() async {
    final Either<ExceptionModel, List<dynamic>> result = await apiService.get<List<dynamic>>(
      path: ApiConfig.projects
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      (List<dynamic> list) => list
          .map((item) => ProjectModel.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList()
    );
  }

  @override
  Future<ProjectModel> toggleProjectFeatured(int id) async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.patch<Map<String, dynamic>>(
      path: '${ApiConfig.projects}/$id/featured'
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      ProjectModel.fromJson
    );
  }

  @override
  Future<ProjectModel> createProject(CreateProjectParams params) async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.post<Map<String, dynamic>>(
      path: ApiConfig.projects,
      data: params.toJson()
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      ProjectModel.fromJson
    );
  }

  @override
  Future<ProjectModel> updateProject(UpdateProjectParams params) async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.put<Map<String, dynamic>>(
      path: '${ApiConfig.projects}/${params.id}',
      data: params.toJson()
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      ProjectModel.fromJson
    );
  }

  @override
  Future<void> deleteProject(int id) async {
    final Either<ExceptionModel, Map<String, dynamic>> result = await apiService.delete<Map<String, dynamic>>(
      path: '${ApiConfig.projects}/$id'
    );

    result.fold(
      (ExceptionModel exception) => throw exception,
      (Map<String, dynamic> _) => null
    );
  }
}
