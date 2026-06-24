import 'dart:async';

import 'package:developer_website_software/core/extensions/string_extension.dart';
import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialMessageList extends StatelessWidget {
  const MaterialMessageList({required this.signals, super.key});

  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;

    return Expanded(
      child: SignalBuilder(
        builder: (BuildContext context) {
          final List<MessageViewModel> displayMessages = signals.messages.value;
          final bool isLoading = signals.isLoading.value;
          final MessageViewModel? selected = signals.selectedMessage.value;

          if (isLoading && displayMessages.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (displayMessages.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  const Icon(Icons.mail_outline, size: 48, color: Colors.grey),
                  const SizedBox(height: 12),
                  Text(
                    'No messages found',
                    style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600], fontWeight: .bold),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const .symmetric(horizontal: 12, vertical: 8),
            itemCount: displayMessages.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (BuildContext context, int index) {
              final MessageViewModel msg = displayMessages[index];
              final bool isSelected = selected?.id == msg.id;

              return SignalBuilder(
                builder: (BuildContext context) {
                  final bool isRead = msg.isRead.value;

                  return Card(
                    elevation: 0,
                    margin: .zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: .circular(8),
                      side: BorderSide(color: isSelected ? theme.primaryColor : (isDark ? Colors.grey[800]! : Colors.grey[300]!)),
                    ),
                    color: isSelected ? theme.primaryColor.withValues(alpha: 0.08) : (isDark ? Colors.grey[900] : Colors.white),
                    child: InkWell(
                      borderRadius: .circular(8),
                      onTap: () => unawaited(signals.selectMessage(msg)),
                      child: Padding(
                        padding: const .all(12),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Row(
                              children: [
                                if (!isRead) ...[
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(color: theme.primaryColor, shape: .circle),
                                  ),
                                  const SizedBox(width: 6),
                                ],
                                Expanded(
                                  child: Text(
                                    msg.fullName,
                                    style: const TextStyle(fontWeight: .bold, fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  msg.createdAt.formatTime(),
                                  style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              msg.serviceType.label,
                              style: TextStyle(
                                fontWeight: .w600,
                                color: isSelected ? theme.primaryColor : Colors.grey[500],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              msg.projectBrief,
                              style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[700], fontSize: 13),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
