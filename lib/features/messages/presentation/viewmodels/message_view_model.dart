import 'package:developer_website_software/features/messages/domain/entities/message_entity.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MessageViewModel {
  MessageViewModel(MessageEntity message) : _message = message, isRead = signal(message.isRead);

  MessageEntity _message;
  MessageEntity get message => _message;

  final Signal<bool> isRead;

  void updateFromEntity(MessageEntity newEntity) {
    _message = newEntity;
    isRead.value = newEntity.isRead;
  }

  int get id => _message.id;
  String get fullName => _message.fullName;
  String get email => _message.email;
  MessageServiceType get serviceType => _message.serviceType;
  MessagePriceRangeType get priceRangeType => _message.priceRangeType;
  String get projectBrief => _message.projectBrief;
  String get createdAt => _message.createdAt;
  String get updatedAt => _message.updatedAt;
}

extension MessageViewModelExtension on List<MessageViewModel> {
  List<MessageViewModel> sortedByDateDesc() {
    return this..sort((MessageViewModel a, MessageViewModel b) {
      final DateTime dateA = DateTime.tryParse(a.createdAt) ?? DateTime(1970);
      final DateTime dateB = DateTime.tryParse(b.createdAt) ?? DateTime(1970);
      return dateB.compareTo(dateA);
    });
  }
}
