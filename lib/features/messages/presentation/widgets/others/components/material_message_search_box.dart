import 'dart:async';

import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:flutter/material.dart';

class MaterialMessageSearchBox extends StatelessWidget {
  const MaterialMessageSearchBox({required this.controller, required this.signals, super.key});

  final TextEditingController controller;
  final MessagesSignals signals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .fromLTRB(16, 16, 16, 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search messages...',
          prefixIcon: const Icon(Icons.search, size: 20),
          contentPadding: const .symmetric(horizontal: 12, vertical: 8),
          border: OutlineInputBorder(borderRadius: .circular(8)),
        ),
        onChanged: (String value) {
          unawaited(signals.setSearch(value));
        },
      ),
    );
  }
}
