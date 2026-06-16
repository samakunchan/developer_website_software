import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/macos/cupertino_admin_toolbar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/others/material_admin_toolbar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/windows/fluent_admin_toolbar.dart';
import 'package:flutter/widgets.dart';

class AdminToolbar extends PlatformWidget {
  const AdminToolbar({super.key});

  @override
  Widget buildCupertino(BuildContext context) {
    return const CupertinoAdminToolbar();
  }

  @override
  Widget buildFluent(BuildContext context) {
    return const FluentAdminToolbar();
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return const MaterialAdminToolbar();
  }
}
