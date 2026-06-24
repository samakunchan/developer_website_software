import 'dart:async';

import 'package:developer_website_software/core/extensions/string_extension.dart';
import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoMessageList extends StatelessWidget {
  const CupertinoMessageList({
    required this.signals,
    super.key,
  });

  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return Expanded(
      child: SignalBuilder(
        builder: (BuildContext context) {
          final List<MessageViewModel> displayMessages = signals.messages.value;
          final bool isLoading = signals.isLoading.value;
          final MessageViewModel? selected = signals.selectedMessage.value;

          if (isLoading && displayMessages.isEmpty) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (displayMessages.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: .center,
                spacing: 12,
                children: [
                  Icon(
                    CupertinoIcons.mail,
                    size: 48,
                    color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey3,
                  ),
                  Text(
                    'No messages found',
                    style: TextStyle(
                      color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey2,
                      fontWeight: .bold,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const .symmetric(horizontal: 12, vertical: 8),
            itemCount: displayMessages.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
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
                        padding: const .all(12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? kGlassBgColor
                              : (isDark ? CupertinoColors.darkBackgroundGray : CupertinoColors.white),
                          borderRadius: .circular(10),
                          border: .all(
                            color: isSelected
                                ? CupertinoTheme.of(context).primaryColor
                                : (isDark ? const Color(0xFF2D2D2D) : CupertinoColors.systemGrey5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Row(
                              children: [
                                if (!isRead) ...[
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: CupertinoTheme.of(context).primaryColor,
                                      shape: .circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                ],
                                Expanded(
                                  child: Text(
                                    msg.fullName,
                                    style: TextStyle(
                                      fontWeight: .bold,
                                      color: isDark ? CupertinoColors.white : CupertinoColors.black,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: .ellipsis,
                                  ),
                                ),
                                Text(
                                  msg.createdAt.formatTime(),
                                  style: TextStyle(
                                    color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey2,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              msg.serviceType.label,
                              style: TextStyle(
                                fontWeight: .w600,
                                color: isSelected
                                    ? CupertinoTheme.of(context).primaryColor
                                    : (isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey2),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              msg.projectBrief,
                              style: TextStyle(
                                color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey,
                                fontSize: 13,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: .ellipsis,
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
