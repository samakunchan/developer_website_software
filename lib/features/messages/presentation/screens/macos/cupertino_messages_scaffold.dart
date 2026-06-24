import 'dart:async';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_detail_body.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_detail_header.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_filters_segment.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_list.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_pagination_footer.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_search_box.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoMessagesScaffold extends StatefulWidget {
  const CupertinoMessagesScaffold({this.isActive = false, super.key});

  final bool isActive;

  @override
  State<CupertinoMessagesScaffold> createState() => _CupertinoMessagesScaffoldState();
}

class _CupertinoMessagesScaffoldState extends State<CupertinoMessagesScaffold> {
  late final MessagesSignals _signals;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _signals = kGetIt<MessagesSignals>();

    if (widget.isActive) {
      unawaited(_signals.fetchMessages());
      unawaited(_signals.fetchUnreadCount());
    }
  }

  @override
  void didUpdateWidget(CupertinoMessagesScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      unawaited(_signals.fetchMessages());
      unawaited(_signals.fetchUnreadCount());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return Row(
      children: [
        /// 1. Messages Sidebar List Pane (Width: 320)
        SizedBox(
          width: 320,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              CupertinoMessageSearchBox(controller: _searchController, signals: _signals),
              CupertinoMessageFiltersSegment(signals: _signals),
              CupertinoMessageList(signals: _signals),
              CupertinoMessagePaginationFooter(signals: _signals)
            ]
          )
        ),

        /// Vertical divider
        Container(
          width: 1,
          color: isDark ? const Color(0xFF2D2D2D) : CupertinoColors.systemGrey5
        ),

        /// 2. Messages Detail Pane
        Expanded(
          child: ColoredBox(
            color: isDark ? kScaffoldBackgroundColor : CupertinoColors.systemGroupedBackground,
            child: SignalBuilder(
              builder: (BuildContext context) {
                final MessageViewModel? selected = _signals.selectedMessage.value;

                if (selected == null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(
                          CupertinoIcons.tray_arrow_down,
                          size: 64,
                          color: isDark ? CupertinoColors.systemGrey2 : CupertinoColors.systemGrey3
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Select a message to view details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: .bold,
                            color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey
                          )
                        )
                      ]
                    )
                  );
                }

                return Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    CupertinoMessageDetailHeader(selected: selected, signals: _signals),
                    CupertinoMessageDetailBody(selected: selected)
                  ]
                );
              }
            )
          )
        )
      ]
    );
  }
}
