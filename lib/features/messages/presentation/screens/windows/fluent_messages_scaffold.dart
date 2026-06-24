import 'dart:async';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_detail_body.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_detail_header.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_filters_segment.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_list.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_pagination_footer.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_search_box.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentMessagesScaffold extends StatefulWidget {
  const FluentMessagesScaffold({this.isActive = false, super.key});

  final bool isActive;

  @override
  State<FluentMessagesScaffold> createState() => _FluentMessagesScaffoldState();
}

class _FluentMessagesScaffoldState extends State<FluentMessagesScaffold> {
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
  void didUpdateWidget(FluentMessagesScaffold oldWidget) {
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
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color borderColor = isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE2E8F0);
    final Color listBg = isDark ? const Color(0xFF202020) : const Color(0xFFF8FAFC);
    final Color detailBg = isDark ? const Color(0xFF1C1C1C) : const Color(0xFFFFFFFF);

    return Row(
      children: [
        /// 1. Messages Sidebar List Pane (Width: 320)
        Container(
          width: 320,
          color: listBg,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              FluentMessageSearchBox(controller: _searchController, signals: _signals),
              FluentMessageFiltersSegment(signals: _signals),
              FluentMessageList(signals: _signals),
              FluentMessagePaginationFooter(signals: _signals),
            ],
          ),
        ),

        /// Vertical divider
        Container(width: 1, color: borderColor),

        /// 2. Messages Detail Pane
        Expanded(
          child: ColoredBox(
            color: detailBg,
            child: SignalBuilder(
              builder: (BuildContext context) {
                final MessageViewModel? selected = _signals.selectedMessage.value;

                if (selected == null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(FluentIcons.all_apps, size: 56, color: isDark ? Colors.grey[60] : Colors.grey[120]),
                        const SizedBox(height: 16),
                        Text(
                          'Select a message to view details',
                          style: TextStyle(fontSize: 14, fontWeight: .bold, color: isDark ? Colors.grey[80] : Colors.grey[120]),
                        ),
                      ],
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    FluentMessageDetailHeader(selected: selected, signals: _signals),
                    FluentMessageDetailBody(selected: selected),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
