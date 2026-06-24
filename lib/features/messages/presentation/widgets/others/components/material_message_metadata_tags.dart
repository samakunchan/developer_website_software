import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:flutter/material.dart';

class MaterialMessageMetadataTags extends StatelessWidget {
  const MaterialMessageMetadataTags({required this.selected, super.key});

  final MessageViewModel selected;

  IconData _getServiceIcon(String id) {
    switch (id) {
      case 'web':
        return Icons.computer;
      case 'mobile':
        return Icons.phone_android;
      case 'mvp':
        return Icons.rocket_launch;
      case 'ai':
        return Icons.psychology;
      case 'api':
        return Icons.api;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;

    return Row(
      spacing: 8,
      children: [
        Chip(
          avatar: Icon(_getServiceIcon(selected.serviceType.id), size: 16, color: isDark ? Colors.grey[300] : Colors.grey[700]),
          label: Text(selected.serviceType.label),
          backgroundColor: isDark ? Colors.grey[850] : Colors.grey[200],
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: .circular(8)),
        ),
        Chip(
          avatar: Icon(Icons.payments_outlined, size: 16, color: isDark ? Colors.grey[300] : Colors.grey[700]),
          label: Text('${selected.priceRangeType.label} ${selected.priceRangeType.currency}'),
          backgroundColor: isDark ? Colors.grey[850] : Colors.grey[200],
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: .circular(8)),
        ),
      ],
    );
  }
}
