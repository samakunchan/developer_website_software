import 'dart:async';

import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:flutter/cupertino.dart';

class CupertinoMessageSearchBox extends StatelessWidget {
  const CupertinoMessageSearchBox({
    required this.controller,
    required this.signals,
    super.key,
  });

  final TextEditingController controller;
  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .fromLTRB(16, 16, 16, 8),
      child: CupertinoSearchTextField(
        controller: controller,
        placeholder: 'Search messages...',
        onChanged: (String value) {
          unawaited(signals.setSearch(value));
        },
      ),
    );
  }
}
