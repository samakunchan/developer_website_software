import 'package:developer_website_software/core/extensions/string_extension.dart';
import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentMessageSenderProfileCard extends StatelessWidget {
  const FluentMessageSenderProfileCard({required this.selected, super.key});

  final MessageViewModel selected;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color borderColor = isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE2E8F0);
    final String avatarInitials = selected.fullName.getInitialAvatar();

    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2B2B2B) : Colors.white,
        borderRadius: .circular(4),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: theme.accentColor.lightest, shape: .circle),
            child: Center(
              child: Text(
                avatarInitials,
                style: TextStyle(color: theme.accentColor, fontWeight: .bold, fontSize: 14),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 2,
              children: [
                Text(selected.fullName, style: const TextStyle(fontWeight: .bold, fontSize: 14)),
                Text(selected.email, style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[80] : Colors.grey[120])),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: .end,
            spacing: 2,
            children: [
              Text(
                selected.createdAt.formatFullDate(),
                style: TextStyle(fontSize: 11, color: isDark ? Colors.grey[80] : Colors.grey[120]),
              ),
              Text(
                selected.createdAt.formatTime(),
                style: TextStyle(fontSize: 11, color: isDark ? Colors.grey[60] : Colors.grey[100]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
