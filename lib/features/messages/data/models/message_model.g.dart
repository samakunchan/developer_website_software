// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageServiceTypeModel _$MessageServiceTypeModelFromJson(
  Map<String, dynamic> json,
) => _MessageServiceTypeModel(
  id: json['id'] as String,
  icon: json['icon'] as String,
  label: json['label'] as String,
);

Map<String, dynamic> _$MessageServiceTypeModelToJson(
  _MessageServiceTypeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'icon': instance.icon,
  'label': instance.label,
};

_MessagePriceRangeTypeModel _$MessagePriceRangeTypeModelFromJson(
  Map<String, dynamic> json,
) => _MessagePriceRangeTypeModel(
  id: json['id'] as String,
  currency: json['currency'] as String,
  label: json['label'] as String,
);

Map<String, dynamic> _$MessagePriceRangeTypeModelToJson(
  _MessagePriceRangeTypeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'currency': instance.currency,
  'label': instance.label,
};

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: (json['id'] as num).toInt(),
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      serviceType: MessageServiceTypeModel.fromJson(
        json['serviceType'] as Map<String, dynamic>,
      ),
      priceRangeType: MessagePriceRangeTypeModel.fromJson(
        json['priceRangeType'] as Map<String, dynamic>,
      ),
      projectBrief: json['projectBrief'] as String,
      isRead: json['isRead'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'serviceType': instance.serviceType,
      'priceRangeType': instance.priceRangeType,
      'projectBrief': instance.projectBrief,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_PaginatedMessagesModel _$PaginatedMessagesModelFromJson(
  Map<String, dynamic> json,
) => _PaginatedMessagesModel(
  messages: (json['messages'] as List<dynamic>)
      .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  currentPage: (json['currentPage'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedMessagesModelToJson(
  _PaginatedMessagesModel instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'total': instance.total,
  'totalPages': instance.totalPages,
  'currentPage': instance.currentPage,
};
