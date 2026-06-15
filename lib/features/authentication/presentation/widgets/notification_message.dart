import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      padding: const .all(12),
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).brightness == .dark
            ? notificationColor.withValues(alpha: .5)
            : notificationColor.withValues(alpha: .1),
        borderRadius: .circular(8),
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
    String title;
    InfoBarSeverity infoBarSeverity;
    switch (status) {
      case NotificationStatus.error:
        title = 'Error';
        infoBarSeverity = .error;
      case NotificationStatus.success:
        title = 'Success';
        infoBarSeverity = .success;
    }
    return InfoBar(
      title: Text(status != NotificationStatus.success ? '' : title),
      content: Text(message),
      severity: infoBarSeverity,
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
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
        border: Border.all(color: notificationColor),
      ),
      child: Row(
        spacing: 10,
        children: [
          if (status != NotificationStatus.success) Icon(Icons.warning, color: notificationColor),

          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: notificationColor),
            ),
          ),
        ],
      ),
    );
  }
}
