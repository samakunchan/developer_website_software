import 'dart:async';

import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoMessagePaginationFooter extends StatelessWidget {
  const CupertinoMessagePaginationFooter({
    required this.signals,
    super.key,
  });

  final MessagesSignals signals;

  void _showPageSizeActionSheet(BuildContext context) {
    unawaited(
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: const Text('Page Size'),
          message: const Text('Select the number of messages to display per page'),
          actions: [
            CupertinoActionSheetAction(
              child: const Text('10'),
              onPressed: () {
                unawaited(signals.setPageSize(10));
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('25'),
              onPressed: () {
                unawaited(signals.setPageSize(25));
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('50'),
              onPressed: () {
                unawaited(signals.setPageSize(50));
                Navigator.pop(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;
    final Color borderColor = isDark ? const Color(0xFF2D2D2D) : CupertinoColors.systemGrey5;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: borderColor),
        ),
      ),
      child: SignalBuilder(
        builder: (BuildContext context) {
          final int page = signals.currentPage.value;
          final int totalPages = signals.totalPages.value;
          final int size = signals.pageSize.value;

          return Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              CupertinoButton(
                padding: .zero,
                minimumSize: .zero,
                onPressed: () => _showPageSizeActionSheet(context),
                child: Text(
                  'Size: $size',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              Row(
                mainAxisSize: .min,
                spacing: 8,
                children: [
                  CupertinoButton(
                    padding: .zero,
                    minimumSize: .zero,
                    onPressed: page <= 1 ? null : () => unawaited(signals.setPage(page - 1)),
                    child: const Icon(CupertinoIcons.chevron_left, size: 18),
                  ),
                  Text(
                    '$page / $totalPages',
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey,
                    ),
                  ),
                  CupertinoButton(
                    padding: .zero,
                    minimumSize: .zero,
                    onPressed: page >= totalPages ? null : () => unawaited(signals.setPage(page + 1)),
                    child: const Icon(CupertinoIcons.chevron_right, size: 18),
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
