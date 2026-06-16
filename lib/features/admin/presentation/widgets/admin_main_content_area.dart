import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/macos/cupertino_admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/others/material_admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/windows/fluent_admin_main_content_area.dart';
import 'package:flutter/widgets.dart';

class AdminMainContentArea extends PlatformWidget {
  const AdminMainContentArea({required this.selectedNavIndex, super.key});

  final int selectedNavIndex;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoAdminMainContentArea(selectedNavIndex: selectedNavIndex);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentAdminMainContentArea(selectedNavIndex: selectedNavIndex);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialAdminMainContentArea(selectedNavIndex: selectedNavIndex);
  }
}
