import 'dart:async';

import 'package:developer_website_software/core/extensions/string_extension.dart';
import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentMessageList extends StatelessWidget {
  const FluentMessageList({required this.signals, super.key});

  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;

    return Expanded(
      child: SignalBuilder(
        builder: (BuildContext context) {
          final List<MessageViewModel> displayMessages = signals.messages.value;
          final bool isLoading = signals.isLoading.value;
          final MessageViewModel? selected = signals.selectedMessage.value;

          if (isLoading && displayMessages.isEmpty) {
            return const Center(child: ProgressRing());
          }

          if (displayMessages.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FluentIcons.mail, size: 40, color: Colors.grey),
                  const SizedBox(height: 12),
                  Text(
                    'No messages found',
                    style: TextStyle(color: isDark ? Colors.grey[80] : Colors.grey[120], fontWeight: .bold),
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

                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => unawaited(signals.selectMessage(msg)),
                      child: Container(
                        padding: const .symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? theme.accentColor.lightest : (isDark ? const Color(0xFF2C2C2C) : Colors.white),
                          borderRadius: .circular(6),
                          border: Border.all(
                            color: isSelected ? theme.accentColor : (isDark ? const Color(0xFF3C3C3C) : const Color(0xFFE2E8F0)),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Row(
                              children: [
                                if (!isRead) ...[
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(color: theme.accentColor, shape: .circle),
                                  ),
                                  const SizedBox(width: 6),
                                ],
                                Expanded(
                                  child: Text(
                                    msg.fullName,
                                    style: TextStyle(
                                      fontWeight: .bold,
                                      color: isDark ? Colors.white : Colors.black,
                                      fontSize: 13,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  msg.createdAt.formatTime(),
                                  style: TextStyle(color: isDark ? Colors.grey[80] : Colors.grey[120], fontSize: 11),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              msg.serviceType.label,
                              style: TextStyle(
                                fontWeight: .w600,
                                color: isSelected ? theme.accentColor : (isDark ? Colors.grey[80] : Colors.grey[120]),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              msg.projectBrief,
                              style: TextStyle(color: isDark ? Colors.grey[80] : Colors.grey[140], fontSize: 12),
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
