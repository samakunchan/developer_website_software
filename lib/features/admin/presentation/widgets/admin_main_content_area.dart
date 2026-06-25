import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/macos/cupertino_admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/others/material_admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/windows/fluent_admin_main_content_area.dart';
import 'package:flutter/widgets.dart';

class AdminMainContentArea extends PlatformWidget {
  const AdminMainContentArea({super.key});

  @override
  Widget buildCupertino(BuildContext context) {
    return const CupertinoAdminMainContentArea();
  }

  @override
  Widget buildFluent(BuildContext context) {
    return const FluentAdminMainContentArea();
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return const MaterialAdminMainContentArea();
  }
}
