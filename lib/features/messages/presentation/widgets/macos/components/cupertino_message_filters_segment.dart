import 'dart:async';

import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_badge_count.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoMessageFiltersSegment extends StatelessWidget {
  const CupertinoMessageFiltersSegment({
    required this.signals,
    super.key,
  });

  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 8),
      child: SignalBuilder(
        builder: (BuildContext context) {
          final String activeFilter = signals.activeFilter.value;
          final Map<String, Widget> children = {
            'all': const Padding(
              padding: .symmetric(vertical: 4),
              child: Text('All', style: TextStyle(fontSize: 13)),
            ),
            'unread': const Padding(
              padding: .symmetric(vertical: 4),
              child: Row(
                mainAxisSize: .min,
                mainAxisAlignment: .center,
                spacing: 4,
                children: [
                  Text('Unread', style: TextStyle(fontSize: 13)),
                  CupertinoMessageBadgeCount(),
                ],
              ),
            ),
            'read': const Padding(
              padding: .symmetric(vertical: 4),
              child: Text('Read', style: TextStyle(fontSize: 13)),
            ),
          };

          return CupertinoSlidingSegmentedControl<String>(
            groupValue: activeFilter,
            children: children,
            onValueChanged: (String? value) {
              if (value != null) {
                unawaited(signals.setFilter(value));
              }
            },
          );
        },
      ),
    );
  }
}
