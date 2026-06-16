import 'package:developer_website_software/features/authentication/presentation/widgets/authentication_notification_message.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentAuthenticationNotificationMessage extends StatelessWidget {
  const FluentAuthenticationNotificationMessage({
    required this.message,
    required this.status,
    super.key
  });

  final String message;
  final NotificationStatus status;

  @override
  Widget build(BuildContext context) {
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
      severity: infoBarSeverity
    );
  }
}
