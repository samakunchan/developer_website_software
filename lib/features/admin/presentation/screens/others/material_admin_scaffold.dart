import 'package:developer_website_software/features/admin/presentation/widgets/admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_toolbar.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/material.dart';

class MaterialAdminScaffold extends StatefulWidget {
  const MaterialAdminScaffold({required this.sidebarWidth, required this.onSidebarResized, super.key});

  final double sidebarWidth;
  final void Function(double delta) onSidebarResized;

  @override
  State<MaterialAdminScaffold> createState() => _MaterialAdminScaffoldState();
}

class _MaterialAdminScaffoldState extends State<MaterialAdminScaffold> {
  int _selectedNavIndex = 0;

  final List<Map<String, dynamic>> _navItems = [
    {'label': 'Dashboard', 'icon': Icons.dashboard_outlined},
    {'label': 'Messages', 'icon': Icons.mail_outline},
    {'label': 'Profiles', 'icon': Icons.account_circle_outlined},
    {'label': 'Projects', 'icon': Icons.folder_special_outlined},
    {'label': 'Analytics', 'icon': Icons.analytics_outlined},
    {'label': 'Settings', 'icon': Icons.settings_outlined}
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;

    final Color sidebarBorder = isDark ? const Color(0xFF1E293B) : LightThemeConstants.glassBorder;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            /// 1. Resizable Sidebar
            AdminSidebar(
              width: widget.sidebarWidth,
              selectedNavIndex: _selectedNavIndex,
              navItems: _navItems,
              onSelectMenu: (int index) => setState(() => _selectedNavIndex = index)
            ),

            /// 2. Drag Handle
            GestureDetector(
              behavior: .translucent,
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                widget.onSidebarResized(details.delta.dx);
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: ColoredBox(
                  color: sidebarBorder,
                  child: const SizedBox(width: 4, height: .infinity)
                )
              )
            ),

            /// 3. Main Content Area
            Expanded(
              child: ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    /// Toolbar
                    const AdminToolbar(),

                    /// Screen Content
                    Expanded(child: AdminMainContentArea(selectedNavIndex: _selectedNavIndex))
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}
