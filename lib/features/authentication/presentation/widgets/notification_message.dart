import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/core/themes/constantes.dart';
import 'package:flutter/cupertino.dart';

enum NotificationStatus { error, success }

class NotificationMessage extends PlatformWidget {
  const NotificationMessage({required this.message, this.status = NotificationStatus.error, super.key});
  final String message;
  final NotificationStatus status;

  @override
  Widget buildCupertino(BuildContext context) {
    Color notificationColor;
    switch (status) {
      case NotificationStatus.error:
        notificationColor = kDangerColor;
      case NotificationStatus.success:
        notificationColor = CupertinoColors.activeGreen;
    }
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).brightness == .dark
            ? notificationColor.withValues(alpha: .5)
            : notificationColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: notificationColor),
      ),
      child: Row(
        spacing: 10,
        children: [
          if (status != NotificationStatus.success)
            Icon(CupertinoIcons.exclamationmark_triangle_fill, size: 18, color: notificationColor),
          Expanded(
            child: Text(
              message,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: notificationColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    // TODO: implement buildFluent
    throw UnimplementedError();
  }

  @override
  Widget buildMaterial(BuildContext context) {
    // TODO: implement buildMaterial
    throw UnimplementedError();
  }
}
