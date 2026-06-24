import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentMessageDetailHeader extends StatelessWidget {
  const FluentMessageDetailHeader({required this.selected, required this.signals, super.key});

  final MessageViewModel selected;
  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color borderColor = isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE2E8F0);

    return Container(
      padding: const .symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF202020) : Colors.white,
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      child: SignalBuilder(
        builder: (BuildContext context) {
          final int selectedIdx = signals.selectedIndex;
          final int total = signals.totalCount.value;
          final int page = signals.currentPage.value;
          final int size = signals.pageSize.value;

          return Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2,
                  children: [
                    Text(
                      'Deployment Inquiry',
                      style: TextStyle(fontSize: 10, fontWeight: .bold, color: isDark ? Colors.grey[80] : Colors.grey[120]),
                    ),
                    Text('${selected.serviceType.label} Pipeline', style: const TextStyle(fontSize: 18, fontWeight: .bold)),
                  ],
                ),
              ),
              Row(
                mainAxisSize: .min,
                spacing: 8,
                children: [
                  Text(
                    '${selectedIdx + 1 + (page - 1) * size} of $total',
                    style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[80] : Colors.grey[120]),
                  ),
                  IconButton(
                    icon: const Icon(FluentIcons.chevron_left_med, size: 12),
                    onPressed: selectedIdx <= 0 ? null : signals.selectPrev,
                  ),
                  IconButton(
                    icon: const Icon(FluentIcons.chevron_right_med, size: 12),
                    onPressed: selectedIdx >= signals.messages.value.length - 1 ? null : signals.selectNext,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
