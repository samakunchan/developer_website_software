import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoMessageBadgeCount extends StatelessWidget {
  const CupertinoMessageBadgeCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(vertical: 4),
      child: Row(
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        spacing: 4,
        children: [
          const Text('Unread', style: TextStyle(fontSize: 13)),
          SignalBuilder(
            builder: (BuildContext context) {
              final int count = kGetIt<MessagesSignals>().unreadCount.value;
              if (count <= 0) return const SizedBox.shrink();
              return Container(
                padding: const .symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  color: CupertinoTheme.of(context).primaryColor,
                  borderRadius: .circular(10),
                ),
                child: Text(
                  '$count',
                  style: const TextStyle(color: CupertinoColors.white, fontSize: 10, fontWeight: .bold),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
