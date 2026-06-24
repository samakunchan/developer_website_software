import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:flutter/cupertino.dart';

class CupertinoMessageMetadataTags extends StatelessWidget {
  const CupertinoMessageMetadataTags({required this.selected, super.key});

  final MessageViewModel selected;

  IconData _getServiceIcon(String id) {
    switch (id) {
      case 'web':
        return CupertinoIcons.desktopcomputer;
      case 'mobile':
        return CupertinoIcons.device_phone_portrait;
      case 'mvp':
        return CupertinoIcons.rocket;
      case 'ai':
        return CupertinoIcons.settings;
      case 'api':
        return CupertinoIcons.link;
      default:
        return CupertinoIcons.question_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return Row(
      spacing: 8,
      children: [
        Container(
          padding: const .symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF1F5F9),
            borderRadius: .circular(8),
          ),
          child: Row(
            mainAxisSize: .min,
            spacing: 6,
            children: [
              Icon(
                _getServiceIcon(selected.serviceType.id),
                size: 14,
                color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey,
              ),
              Text(
                selected.serviceType.label,
                style: const TextStyle(fontSize: 13, color: CupertinoColors.white, fontWeight: .w500),
              ),
            ],
          ),
        ),
        Container(
          padding: const .symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF1F5F9),
            borderRadius: .circular(8),
          ),
          child: Row(
            mainAxisSize: .min,
            spacing: 6,
            children: [
              Icon(CupertinoIcons.creditcard, size: 14, color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey),
              Text(
                '${selected.priceRangeType.label} ${selected.priceRangeType.currency}',
                style: const TextStyle(fontSize: 13, color: CupertinoColors.white, fontWeight: .w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
