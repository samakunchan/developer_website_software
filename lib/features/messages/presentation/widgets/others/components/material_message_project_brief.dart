import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:flutter/material.dart';

class MaterialMessageProjectBrief extends StatelessWidget {
  const MaterialMessageProjectBrief({required this.selected, super.key});

  final MessageViewModel selected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color borderColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          'PROJECT BRIEF',
          style: TextStyle(fontSize: 11, fontWeight: .bold, color: isDark ? Colors.grey[400] : Colors.grey[600]),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          margin: .zero,
          shape: RoundedRectangleBorder(
            borderRadius: .circular(12),
            side: BorderSide(color: borderColor),
          ),
          color: isDark ? Colors.grey[900] : Colors.white,
          child: Padding(
            padding: const .all(20),
            child: SelectableText(selected.projectBrief, style: const TextStyle(fontSize: 15, height: 1.5)),
          ),
        ),
      ],
    );
  }
}
