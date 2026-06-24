import 'package:developer_website_software/core/extensions/string_extension.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:flutter/cupertino.dart';

class CupertinoMessageSenderProfileCard extends StatelessWidget {
  const CupertinoMessageSenderProfileCard({required this.selected, super.key});

  final MessageViewModel selected;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;
    final String avatarInitials = selected.fullName.getInitialAvatar();

    return Container(
      padding: const .all(16),
      decoration: BoxDecoration(
        color: isDark ? CupertinoColors.darkBackgroundGray : CupertinoColors.white,
        borderRadius: .circular(12),
        border: Border.all(color: isDark ? const Color(0xFF2D2D2D) : CupertinoColors.systemGrey5),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: CupertinoTheme.of(context).primaryColor.withValues(alpha: 0.1), shape: .circle),
            child: Center(
              child: Text(
                avatarInitials,
                style: TextStyle(color: CupertinoTheme.of(context).primaryColor, fontWeight: .bold, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 2,
              children: [
                Text(
                  selected.fullName,
                  style: TextStyle(
                    fontWeight: .bold,
                    fontSize: 15,
                    color: isDark ? CupertinoColors.white : CupertinoColors.black,
                  ),
                ),
                Text(
                  selected.email,
                  style: TextStyle(fontSize: 13, color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: .end,
            spacing: 2,
            children: [
              Text(
                selected.createdAt.formatFullDate(),
                style: TextStyle(fontSize: 12, color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey),
              ),
              Text(
                selected.createdAt.formatTime(),
                style: TextStyle(fontSize: 12, color: isDark ? CupertinoColors.systemGrey2 : CupertinoColors.systemGrey2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
