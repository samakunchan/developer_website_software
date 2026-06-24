import 'package:developer_website_software/core/extensions/string_extension.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:flutter/material.dart';

class MaterialMessageSenderProfileCard extends StatelessWidget {
  const MaterialMessageSenderProfileCard({required this.selected, super.key});

  final MessageViewModel selected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color borderColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;
    final String avatarInitials = selected.fullName.getInitialAvatar();

    return Card(
      elevation: 0,
      margin: .zero,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(12),
        side: BorderSide(color: borderColor),
      ),
      color: isDark ? Colors.grey[900] : Colors.white,
      child: Padding(
        padding: const .all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: theme.primaryColor.withValues(alpha: 0.1),
              child: Text(
                avatarInitials,
                style: TextStyle(color: theme.primaryColor, fontWeight: .bold, fontSize: 16),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 2,
                children: [
                  Text(selected.fullName, style: const TextStyle(fontWeight: .bold, fontSize: 15)),
                  Text(selected.email, style: TextStyle(fontSize: 13, color: isDark ? Colors.grey[400] : Colors.grey[600])),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: .end,
              spacing: 2,
              children: [
                Text(
                  selected.createdAt.formatFullDate(),
                  style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[400] : Colors.grey[600]),
                ),
                Text(
                  selected.createdAt.formatTime(),
                  style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[500] : Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
