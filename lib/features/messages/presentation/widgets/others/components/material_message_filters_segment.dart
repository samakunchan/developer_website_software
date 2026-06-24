import 'dart:async';

import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/others/components/material_message_badge_count.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialMessageFiltersSegment extends StatelessWidget {
  const MaterialMessageFiltersSegment({
    required this.signals,
    super.key,
  });

  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 4),
      child: SignalBuilder(
        builder: (BuildContext context) {
          final String activeFilter = signals.activeFilter.value;

          return Row(
            spacing: 8,
            children: [
              Expanded(
                child: ChoiceChip(
                  label: const Text('All', style: TextStyle(fontSize: 12)),
                  selected: activeFilter == 'all',
                  onSelected: (_) => unawaited(signals.setFilter('all')),
                ),
              ),
              Expanded(
                child: ChoiceChip(
                  label: MaterialMessageBadgeCount(
                    isSelected: activeFilter == 'unread',
                  ),
                  selected: activeFilter == 'unread',
                  onSelected: (_) => unawaited(signals.setFilter('unread')),
                ),
              ),
              Expanded(
                child: ChoiceChip(
                  label: const Text('Read', style: TextStyle(fontSize: 12)),
                  selected: activeFilter == 'read',
                  onSelected: (_) => unawaited(signals.setFilter('read')),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
