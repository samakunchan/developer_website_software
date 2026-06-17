import 'package:developer_website_software/features/admin/presentation/widgets/admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_toolbar.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';

class CupertinoAdminScaffold extends StatefulWidget {
  const CupertinoAdminScaffold({required this.sidebarWidth, required this.onSidebarResized, super.key});

  final double sidebarWidth;
  final void Function(double delta) onSidebarResized;

  @override
  State<CupertinoAdminScaffold> createState() => _CupertinoAdminScaffoldState();
}

class _CupertinoAdminScaffoldState extends State<CupertinoAdminScaffold> {
  int _selectedNavIndex = 0;

  final List<Map<String, dynamic>> _navItems = [
    {'label': 'Dashboard', 'icon': CupertinoIcons.square_grid_2x2},
    {'label': 'Messages', 'icon': CupertinoIcons.chat_bubble},
    {'label': 'Profiles', 'icon': CupertinoIcons.person_crop_circle},
    {'label': 'Projects', 'icon': CupertinoIcons.folder},
    {'label': 'Analytics', 'icon': CupertinoIcons.graph_square},
    {'label': 'Settings', 'icon': CupertinoIcons.settings},
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Row(
          children: [
            /// 1. Resizable Sidebar
            AdminSidebar(
              width: widget.sidebarWidth,
              selectedNavIndex: _selectedNavIndex,
              navItems: _navItems,
              onSelectMenu: (int index) => setState(() => _selectedNavIndex = index),
            ),

            /// 2. Drag Handle
            GestureDetector(
              behavior: .translucent,
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                widget.onSidebarResized(details.delta.dx);
              },
              child: const MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: ColoredBox(
                  color: kSidebarBorderColor,
                  child: SizedBox(width: 4, height: .infinity),
                ),
              ),
            ),

            /// 3. Main Content Area
            Expanded(
              child: ColoredBox(
                color: isDark ? kScaffoldBackgroundColor : CupertinoColors.systemBackground,
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    /// Toolbar
                    const AdminToolbar(),

                    /// Screen Content
                    Expanded(child: AdminMainContentArea(selectedNavIndex: _selectedNavIndex)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
