import 'dart:async';

import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_badge_count.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentMessageFiltersSegment extends StatelessWidget {
  const FluentMessageFiltersSegment({required this.signals, super.key});

  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;

    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 8),
      child: SignalBuilder(
        builder: (BuildContext context) {
          final String activeFilter = signals.activeFilter.value;

          return Row(
            spacing: 4,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => unawaited(signals.setFilter('all')),
                  child: Container(
                    padding: const .symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: activeFilter == 'all' ? theme.accentColor : Colors.transparent,
                      borderRadius: .circular(4),
                    ),
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: activeFilter == 'all' ? .bold : .normal,
                        color: activeFilter == 'all' ? Colors.white : (isDark ? Colors.white : Colors.black),
                      ),
                      textAlign: .center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => unawaited(signals.setFilter('unread')),
                  child: Container(
                    padding: const .symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: activeFilter == 'unread' ? theme.accentColor : Colors.transparent,
                      borderRadius: .circular(4),
                    ),
                    // child: FluentMessageBadgeCount(isSelected: activeFilter == 'unread'),
                    child: Padding(
                      padding: const .symmetric(vertical: 4),
                      child: Row(
                        mainAxisSize: .min,
                        mainAxisAlignment: .center,
                        spacing: 4,
                        children: [
                          Text(
                            'Unread',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: activeFilter == 'unread' ? .bold : .normal,
                              color: activeFilter == 'unread' ? Colors.white : (isDark ? Colors.white : Colors.black),
                            ),
                          ),
                          FluentMessageBadgeCount(isSelected: activeFilter == 'unread'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => unawaited(signals.setFilter('read')),
                  child: Container(
                    padding: const .symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: activeFilter == 'read' ? theme.accentColor : Colors.transparent,
                      borderRadius: .circular(4),
                    ),
                    child: Text(
                      'Read',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: activeFilter == 'read' ? .bold : .normal,
                        color: activeFilter == 'read' ? Colors.white : (isDark ? Colors.white : Colors.black),
                      ),
                      textAlign: .center,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
