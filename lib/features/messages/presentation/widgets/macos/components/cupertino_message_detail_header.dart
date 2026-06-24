import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoMessageDetailHeader extends StatelessWidget {
  const CupertinoMessageDetailHeader({
    required this.selected,
    required this.signals,
    super.key,
  });

  final MessageViewModel selected;
  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return Container(
      padding: const .symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: isDark ? CupertinoColors.darkBackgroundGray : CupertinoColors.white,
        border: Border(
          bottom: BorderSide(
            color: isDark ? const Color(0xFF2D2D2D) : CupertinoColors.systemGrey5,
          ),
        ),
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
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: .bold,
                        color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey,
                      ),
                    ),
                    Text(
                      '${selected.serviceType.label} Pipeline',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .bold,
                        color: isDark ? CupertinoColors.white : CupertinoColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: .min,
                spacing: 12,
                children: [
                  Text(
                    '${selectedIdx + 1 + (page - 1) * size} of $total',
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey,
                    ),
                  ),
                  CupertinoButton(
                    padding: .zero,
                    minimumSize: .zero,
                    onPressed: selectedIdx <= 0 ? null : signals.selectPrev,
                    child: const Icon(CupertinoIcons.chevron_left, size: 20),
                  ),
                  CupertinoButton(
                    padding: .zero,
                    minimumSize: .zero,
                    onPressed: selectedIdx >= signals.messages.value.length - 1 ? null : signals.selectNext,
                    child: const Icon(CupertinoIcons.chevron_right, size: 20),
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
