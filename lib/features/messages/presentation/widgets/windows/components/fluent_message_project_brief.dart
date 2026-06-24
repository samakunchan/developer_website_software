import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentMessageProjectBrief extends StatelessWidget {
  const FluentMessageProjectBrief({required this.selected, super.key});

  final MessageViewModel selected;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;
    final Color borderColor = isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE2E8F0);

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          'PROJECT BRIEF',
          style: TextStyle(fontSize: 10, fontWeight: .bold, color: isDark ? Colors.grey[80] : Colors.grey[120]),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const .all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2B2B2B) : Colors.white,
            borderRadius: .circular(4),
            border: Border.all(color: borderColor),
          ),
          child: SelectionArea(child: Text(selected.projectBrief, style: const TextStyle(fontSize: 14, height: 1.4))),
        ),
      ],
    );
  }
}
