import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/messages/domain/entities/message_entity.dart';
import 'package:developer_website_software/features/messages/domain/usecases/get_messages_use_case.dart';
import 'package:developer_website_software/features/messages/domain/usecases/get_unread_messages_count_use_case.dart';
import 'package:developer_website_software/features/messages/domain/usecases/toggle_message_read_use_case.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MessagesSignals {
  MessagesSignals({
    required this.getMessagesUseCase,
    required this.getUnreadMessagesCountUseCase,
    required this.toggleMessageReadUseCase,
  });

  final GetMessagesUseCase getMessagesUseCase;
  final GetUnreadMessagesCountUseCase getUnreadMessagesCountUseCase;
  final ToggleMessageReadUseCase toggleMessageReadUseCase;

  final Signal<List<MessageViewModel>> messages = signal<List<MessageViewModel>>([]);
  final Signal<int> unreadCount = signal<int>(0);
  final Signal<int> totalCount = signal<int>(0);
  final Signal<int> totalPages = signal<int>(1);
  final Signal<int> currentPage = signal<int>(1);
  final Signal<int> pageSize = signal<int>(10);
  final Signal<String> activeFilter = signal<String>('all');
  final Signal<String> searchQuery = signal<String>('');
  final Signal<MessageViewModel?> selectedMessage = signal<MessageViewModel?>(null);

  final Signal<bool> isLoading = signal<bool>(false);
  final Signal<bool> isTogglingRead = signal<bool>(false);
  final Signal<String?> errorMessage = signal<String?>(null);

  int get selectedIndex {
    final selected = selectedMessage.value;
    if (selected == null) return -1;
    return messages.value.indexWhere((m) => m.id == selected.id);
  }

  Future<void> fetchMessages() async {
    isLoading.value = true;
    errorMessage.value = null;

    final params = GetMessagesParams(
      page: currentPage.value,
      pageSize: pageSize.value,
      filter: activeFilter.value,
      search: searchQuery.value.isEmpty ? null : searchQuery.value,
    );

    final Either<Failure, PaginatedMessages> result = await getMessagesUseCase(params);

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (PaginatedMessages paginated) {
        messages.value = paginated.messages.map(MessageViewModel.new).toList();
        totalCount.value = paginated.total;
        totalPages.value = paginated.totalPages;
        currentPage.value = paginated.currentPage;

        // Maintain selection if possible, otherwise clear it or select first as fallback
        final selected = selectedMessage.value;
        if (selected != null) {
          final found = messages.value.any((m) => m.id == selected.id);
          if (!found) {
            selectedMessage.value = null;
          }
        }
      },
    );

    isLoading.value = false;
  }

  Future<void> fetchUnreadCount() async {
    final Either<Failure, int> result = await getUnreadMessagesCountUseCase();
    result.fold(
      (_) => null,
      (count) {
        unreadCount.value = count;
      },
    );
  }

  Future<void> selectMessage(MessageViewModel? message) async {
    selectedMessage.value = message;
    if (message != null && !message.isRead.value) {
      await toggleRead(message, isRead: true);
    }
  }

  Future<void> setFilter(String filter) async {
    activeFilter.value = filter;
    currentPage.value = 1;
    selectedMessage.value = null;
    await fetchMessages();
  }

  Future<void> setSearch(String query) async {
    searchQuery.value = query;
    currentPage.value = 1;
    await fetchMessages();
  }

  Future<void> setPage(int page) async {
    if (page >= 1 && page <= totalPages.value) {
      currentPage.value = page;
      await fetchMessages();
    }
  }

  Future<void> setPageSize(int size) async {
    pageSize.value = size;
    currentPage.value = 1;
    await fetchMessages();
  }

  Future<void> toggleRead(MessageViewModel vm, {required bool isRead}) async {
    isTogglingRead.value = true;
    final Either<Failure, MessageEntity> result = await toggleMessageReadUseCase(vm.id, isRead: isRead);

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (MessageEntity updated) {
        vm.updateFromEntity(updated);
        unawaited(fetchUnreadCount());
      },
    );
    isTogglingRead.value = false;
  }

  void selectNext() {
    final index = selectedIndex;
    final list = messages.value;
    if (index >= 0 && index < list.length - 1) {
      unawaited(selectMessage(list[index + 1]));
    }
  }

  void selectPrev() {
    final index = selectedIndex;
    final list = messages.value;
    if (index > 0) {
      unawaited(selectMessage(list[index - 1]));
    }
  }
}
