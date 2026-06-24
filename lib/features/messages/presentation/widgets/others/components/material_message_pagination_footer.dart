import 'dart:async';

import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialMessagePaginationFooter extends StatelessWidget {
  const MaterialMessagePaginationFooter({required this.signals, super.key});

  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color borderColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;

    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 8),
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
              DropdownButton<int>(
                value: size,
                underline: const SizedBox.shrink(),
                items: const [
                  DropdownMenuItem(value: 10, child: Text('10')),
                  DropdownMenuItem(value: 25, child: Text('25')),
                  DropdownMenuItem(value: 50, child: Text('50')),
                ],
                onChanged: (int? val) {
                  if (val != null) {
                    unawaited(signals.setPageSize(val));
                  }
                },
              ),
              Row(
                mainAxisSize: .min,
                spacing: 4,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, size: 20),
                    onPressed: page <= 1 ? null : () => unawaited(signals.setPage(page - 1)),
                  ),
                  Text(
                    '$page / $totalPages',
                    style: TextStyle(fontSize: 13, color: isDark ? Colors.grey[400] : Colors.grey[600]),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, size: 20),
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
