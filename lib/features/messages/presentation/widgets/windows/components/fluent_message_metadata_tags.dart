import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentMessageMetadataTags extends StatelessWidget {
  const FluentMessageMetadataTags({required this.selected, super.key});

  final MessageViewModel selected;

  IconData _getServiceIcon(String id) {
    switch (id) {
      case 'web':
        return FluentIcons.globe;
      case 'mobile':
        return FluentIcons.cell_phone;
      case 'mvp':
        return FluentIcons.rocket;
      case 'ai':
        return FluentIcons.settings;
      case 'api':
        return FluentIcons.link;
      default:
        return FluentIcons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;

    return Row(
      spacing: 8,
      children: [
        Container(
          padding: const .symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF1F5F9),
            borderRadius: .circular(4),
          ),
          child: Row(
            mainAxisSize: .min,
            spacing: 6,
            children: [
              Icon(_getServiceIcon(selected.serviceType.id), size: 12, color: isDark ? Colors.grey[80] : Colors.grey[120]),
              Text(selected.serviceType.label, style: const TextStyle(fontSize: 12, fontWeight: .w500)),
            ],
          ),
        ),
        Container(
          padding: const .symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF1F5F9),
            borderRadius: .circular(4),
          ),
          child: Row(
            mainAxisSize: .min,
            spacing: 6,
            children: [
              Icon(FluentIcons.payment_card, size: 12, color: isDark ? Colors.grey[80] : Colors.grey[120]),
              Text(
                '${selected.priceRangeType.label} ${selected.priceRangeType.currency}',
                style: const TextStyle(fontSize: 12, fontWeight: .w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
