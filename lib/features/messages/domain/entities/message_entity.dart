import 'package:equatable/equatable.dart';

class MessageServiceType extends Equatable {
  const MessageServiceType({
    required this.id,
    required this.icon,
    required this.label,
  });

  final String id;
  final String icon;
  final String label;

  @override
  List<Object?> get props => [id, icon, label];
}

class MessagePriceRangeType extends Equatable {
  const MessagePriceRangeType({
    required this.id,
    required this.currency,
    required this.label,
  });

  final String id;
  final String currency;
  final String label;

  @override
  List<Object?> get props => [id, currency, label];
}

class MessageEntity extends Equatable {
  const MessageEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.serviceType,
    required this.priceRangeType,
    required this.projectBrief,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String fullName;
  final String email;
  final MessageServiceType serviceType;
  final MessagePriceRangeType priceRangeType;
  final String projectBrief;
  final bool isRead;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        serviceType,
        priceRangeType,
        projectBrief,
        isRead,
        createdAt,
        updatedAt,
      ];
}

class PaginatedMessages extends Equatable {
  const PaginatedMessages({
    required this.messages,
    required this.total,
    required this.totalPages,
    required this.currentPage,
  });

  final List<MessageEntity> messages;
  final int total;
  final int totalPages;
  final int currentPage;

  @override
  List<Object?> get props => [messages, total, totalPages, currentPage];
}

class GetMessagesParams extends Equatable {
  const GetMessagesParams({
    this.page = 1,
    this.pageSize = 10,
    this.filter = 'all',
    this.search,
  });

  final int page;
  final int pageSize;
  final String filter;
  final String? search;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'page': page,
      'pageSize': pageSize,
      'filter': filter,
      if (search != null && search!.isNotEmpty) 'search': search,
    };
  }

  @override
  List<Object?> get props => [page, pageSize, filter, search];
}
