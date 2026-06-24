import 'dart:async';

import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentMessageSearchBox extends StatelessWidget {
  const FluentMessageSearchBox({required this.controller, required this.signals, super.key});

  final TextEditingController controller;
  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .fromLTRB(16, 16, 16, 8),
      child: TextBox(
        controller: controller,
        placeholder: 'Search messages...',
        prefix: const Padding(padding: .only(left: 8), child: Icon(FluentIcons.search, size: 14)),
        onChanged: (String value) {
          unawaited(signals.setSearch(value));
        },
      ),
    );
  }
}
