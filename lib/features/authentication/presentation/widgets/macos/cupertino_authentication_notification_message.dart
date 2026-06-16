import 'package:developer_website_software/features/authentication/presentation/widgets/authentication_notification_message.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';

class CupertinoAuthenticationNotificationMessage extends StatelessWidget {
  const CupertinoAuthenticationNotificationMessage({
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
        notificationColor = kDangerColor;
      case NotificationStatus.success:
        notificationColor = CupertinoColors.activeGreen;
    }
    return Container(
      padding: const .all(12),
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).brightness == .dark
            ? notificationColor.withValues(alpha: .5)
            : notificationColor.withValues(alpha: .1),
        borderRadius: .circular(8),
        border: Border.all(color: notificationColor)
      ),
      child: Row(
        spacing: 10,
        children: [
          if (status != NotificationStatus.success)
            Icon(CupertinoIcons.exclamationmark_triangle_fill, size: 18, color: notificationColor),
          Expanded(
            child: Text(
              message,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: notificationColor)
            )
          )
        ]
      )
    );
  }
}
