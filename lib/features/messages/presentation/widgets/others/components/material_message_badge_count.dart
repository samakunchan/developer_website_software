import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialMessageBadgeCount extends StatelessWidget {
  const MaterialMessageBadgeCount({required this.isSelected, super.key});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;

    return SignalBuilder(
      builder: (BuildContext context) {
        final count = kGetIt<MessagesSignals>().unreadCount.value;
        if (count <= 0) return const SizedBox.shrink();
        return Container(
          padding: const .symmetric(horizontal: 6, vertical: 1),
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? Colors.black.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.3))
                : theme.primaryColor,
            borderRadius: .circular(10),
          ),
          child: Text(
            '$count',
            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: .bold),
          ),
        );
      },
    );
  }
}
