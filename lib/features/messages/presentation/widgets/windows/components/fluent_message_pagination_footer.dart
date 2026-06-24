import 'dart:async';

import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentMessagePaginationFooter extends StatelessWidget {
  const FluentMessagePaginationFooter({required this.signals, super.key});

  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color borderColor = isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE2E8F0);

    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: SignalBuilder(
        builder: (BuildContext context) {
          final int page = signals.currentPage.value;
          final int totalPages = signals.totalPages.value;
          final int size = signals.pageSize.value;

          return Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              SizedBox(
                width: 80,
                child: ComboBox<int>(
                  value: size,
                  items: const [
                    ComboBoxItem(value: 10, child: Text('10')),
                    ComboBoxItem(value: 25, child: Text('25')),
                    ComboBoxItem(value: 50, child: Text('50')),
                  ],
                  onChanged: (int? val) {
                    if (val != null) {
                      unawaited(signals.setPageSize(val));
                    }
                  },
                ),
              ),
              Row(
                mainAxisSize: .min,
                spacing: 4,
                children: [
                  IconButton(
                    icon: const Icon(FluentIcons.chevron_left, size: 10),
                    onPressed: page <= 1 ? null : () => unawaited(signals.setPage(page - 1)),
                  ),
                  Text('$page / $totalPages', style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[80] : Colors.grey[120])),
                  IconButton(
                    icon: const Icon(FluentIcons.chevron_right, size: 10),
                    onPressed: page >= totalPages ? null : () => unawaited(signals.setPage(page + 1)),
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
