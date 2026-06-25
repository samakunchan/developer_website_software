import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentMessageBadgeCount extends StatelessWidget {
  const FluentMessageBadgeCount({required this.isSelected, super.key});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
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
                : theme.accentColor,
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
