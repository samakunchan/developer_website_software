import 'package:developer_website_software/features/messages/domain/entities/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageServiceTypeModel with _$MessageServiceTypeModel {
  const factory MessageServiceTypeModel({
    required String id,
    required String icon,
    required String label,
  }) = _MessageServiceTypeModel;

  const MessageServiceTypeModel._();

  factory MessageServiceTypeModel.fromJson(Map<String, dynamic> json) =>
      _$MessageServiceTypeModelFromJson(json);

  MessageServiceType toEntity() => MessageServiceType(id: id, icon: icon, label: label);
}

@freezed
abstract class MessagePriceRangeTypeModel with _$MessagePriceRangeTypeModel {
  const factory MessagePriceRangeTypeModel({
    required String id,
    required String currency,
    required String label,
  }) = _MessagePriceRangeTypeModel;

  const MessagePriceRangeTypeModel._();

  factory MessagePriceRangeTypeModel.fromJson(Map<String, dynamic> json) =>
      _$MessagePriceRangeTypeModelFromJson(json);

  MessagePriceRangeType toEntity() => MessagePriceRangeType(id: id, currency: currency, label: label);
}

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    required int id,
    required String fullName,
    required String email,
    required MessageServiceTypeModel serviceType,
    required MessagePriceRangeTypeModel priceRangeType,
    required String projectBrief,
    required bool isRead,
    required String createdAt,
    required String updatedAt,
  }) = _MessageModel;

  const MessageModel._();

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  MessageEntity toEntity() => MessageEntity(
        id: id,
        fullName: fullName,
        email: email,
        serviceType: serviceType.toEntity(),
        priceRangeType: priceRangeType.toEntity(),
        projectBrief: projectBrief,
        isRead: isRead,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

@freezed
abstract class PaginatedMessagesModel with _$PaginatedMessagesModel {
  const factory PaginatedMessagesModel({
    required List<MessageModel> messages,
    required int total,
    required int totalPages,
    required int currentPage,
  }) = _PaginatedMessagesModel;

  const PaginatedMessagesModel._();

  factory PaginatedMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMessagesModelFromJson(json);

  PaginatedMessages toEntity() => PaginatedMessages(
        messages: messages.map((m) => m.toEntity()).toList(),
        total: total,
        totalPages: totalPages,
        currentPage: currentPage,
      );
}
