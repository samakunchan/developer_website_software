import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/network/api_config.dart';
import 'package:developer_website_software/core/network/api_service_impl.dart';
import 'package:developer_website_software/core/network/exception_model.dart';
import 'package:developer_website_software/features/messages/data/models/message_model.dart';
import 'package:developer_website_software/features/messages/domain/entities/message_entity.dart';

abstract class MessagesRemoteDataSource {
  Future<PaginatedMessagesModel> getMessages(GetMessagesParams params);

  Future<int> getUnreadMessagesCount();

  Future<MessageModel> toggleMessageRead(int id, {required bool isRead});
}

class MessagesRemoteDataSourceImpl implements MessagesRemoteDataSource {
  MessagesRemoteDataSourceImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<PaginatedMessagesModel> getMessages(GetMessagesParams params) async {
    final Either<ExceptionModel, Map<String, dynamic>> result =
        await apiService.get<Map<String, dynamic>>(
      path: ApiConfig.messages,
      queryParameters: params.toJson(),
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      PaginatedMessagesModel.fromJson,
    );
  }

  @override
  Future<int> getUnreadMessagesCount() async {
    final Either<ExceptionModel, Map<String, dynamic>> result =
        await apiService.get<Map<String, dynamic>>(
      path: ApiConfig.unreadMessagesCount,
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      (Map<String, dynamic> data) {
        final countValue = data['count'];
        if (countValue is int) {
          return countValue;
        } else if (countValue is String) {
          return int.tryParse(countValue) ?? 0;
        }
        return 0;
      },
    );
  }

  @override
  Future<MessageModel> toggleMessageRead(int id, {required bool isRead}) async {
    final Either<ExceptionModel, Map<String, dynamic>> result =
        await apiService.patch<Map<String, dynamic>>(
      path: '${ApiConfig.messages}/$id/read',
      data: <String, dynamic>{'isRead': isRead},
    );

    return result.fold(
      (ExceptionModel exception) => throw exception,
      (Map<String, dynamic> data) {
        // The API returns { success: true, message: { ... } }
        final messageData = data['message'];
        if (messageData is Map<String, dynamic>) {
          return MessageModel.fromJson(messageData);
        }
        throw const ExceptionModel(
          message: 'Invalid response from server when marking message as read',
          exceptionName: 'API_RESPONSE_ERROR',
          statusCode: 500,
        );
      },
    );
  }
}
