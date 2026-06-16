import 'package:developer_website_software/features/authentication/presentation/widgets/authentication_notification_message.dart';
import 'package:flutter/material.dart';

class MaterialAuthenticationNotificationMessage extends StatelessWidget {
  const MaterialAuthenticationNotificationMessage({
    required this.message,
    required this.status,
    super.key
  });

  final String message;
  final NotificationStatus status;

  @override
  Widget build(BuildContext context) {
    Color notificationColor;
    switch (status) {
      case NotificationStatus.error:
        notificationColor = Theme.of(context).colorScheme.error;
      case NotificationStatus.success:
        notificationColor = Colors.green;
    }

    return Container(
      padding: const .all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == .dark
            ? notificationColor.withValues(alpha: .5)
            : notificationColor.withValues(alpha: .1),
        borderRadius: .circular(8),
        border: Border.all(color: notificationColor)
      ),
      child: Row(
        spacing: 10,
        children: [
          if (status != NotificationStatus.success)
            Icon(Icons.warning, color: notificationColor),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: notificationColor)
            )
          )
        ]
      )
    );
  }
}
