import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialMessageDetailHeader extends StatelessWidget {
  const MaterialMessageDetailHeader({required this.selected, required this.signals, super.key});

  final MessageViewModel selected;
  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color borderColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;

    return Container(
      padding: const .symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
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
                  spacing: 4,
                  children: [
                    Text(
                      'Deployment Inquiry',
                      style: TextStyle(fontSize: 11, fontWeight: .bold, color: isDark ? Colors.grey[400] : Colors.grey[600]),
                    ),
                    Text('${selected.serviceType.label} Pipeline', style: const TextStyle(fontSize: 20, fontWeight: .bold)),
                  ],
                ),
              ),
              Row(
                mainAxisSize: .min,
                spacing: 8,
                children: [
                  Text(
                    '${selectedIdx + 1 + (page - 1) * size} of $total',
                    style: TextStyle(fontSize: 13, color: isDark ? Colors.grey[400] : Colors.grey[600]),
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_left),
                    onPressed: selectedIdx <= 0 ? null : signals.selectPrev,
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_right),
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
