import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/macos/cupertino_authentication_notification_message.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/others/material_authentication_notification_message.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/windows/fluent_authentication_notification_message.dart';
import 'package:flutter/widgets.dart';

enum NotificationStatus { error, success }

class AuthenticationNotificationMessage extends PlatformWidget {
  const AuthenticationNotificationMessage({
    required this.message,
    this.status = NotificationStatus.error,
    super.key
  });

  final String message;
  final NotificationStatus status;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoAuthenticationNotificationMessage(
      message: message,
      status: status
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentAuthenticationNotificationMessage(
      message: message,
      status: status
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialAuthenticationNotificationMessage(
      message: message,
      status: status
    );
  }
}
