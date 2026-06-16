import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/macos/cupertino_admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/others/material_admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/windows/fluent_admin_sidebar.dart';
import 'package:flutter/widgets.dart';

class AdminSidebar extends PlatformWidget {
  const AdminSidebar({required this.selectedNavIndex, required this.navItems, this.width, super.key, this.onSelectMenu});

  final double? width;
  final int selectedNavIndex;
  final List<Map<String, dynamic>> navItems;
  final ValueChanged<int>? onSelectMenu;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoAdminSidebar(
      selectedNavIndex: selectedNavIndex,
      navItems: navItems,
      width: width,
      onSelectMenu: onSelectMenu
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentAdminSidebar(selectedNavIndex: selectedNavIndex, navItems: navItems, width: width, onSelectMenu: onSelectMenu);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialAdminSidebar(selectedNavIndex: selectedNavIndex, navItems: navItems, width: width, onSelectMenu: onSelectMenu);
  }
}
