import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/macos/cupertino_admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/others/material_admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/windows/fluent_admin_sidebar.dart';
import 'package:flutter/widgets.dart';

class AdminSidebar extends PlatformWidget {
  const AdminSidebar({this.width, super.key});

  final double? width;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoAdminSidebar(width: width);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentAdminSidebar(width: width);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialAdminSidebar(width: width);
  }
}
