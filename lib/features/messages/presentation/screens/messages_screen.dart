import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/messages/presentation/screens/macos/cupertino_messages_scaffold.dart';
import 'package:developer_website_software/features/messages/presentation/screens/others/material_messages_scaffold.dart';
import 'package:developer_website_software/features/messages/presentation/screens/windows/fluent_messages_scaffold.dart';
import 'package:flutter/widgets.dart';

class MessagesScreen extends PlatformWidget {
  const MessagesScreen({this.isActive = false, super.key});

  final bool isActive;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoMessagesScaffold(isActive: isActive);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentMessagesScaffold(isActive: isActive);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialMessagesScaffold(isActive: isActive);
  }
}
