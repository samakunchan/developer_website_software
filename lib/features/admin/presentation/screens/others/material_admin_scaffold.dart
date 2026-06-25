import 'package:developer_website_software/features/admin/presentation/widgets/admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_toolbar.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/material.dart';

class MaterialAdminScaffold extends StatelessWidget {
  const MaterialAdminScaffold({required this.sidebarWidth, required this.onSidebarResized, super.key});

  final double sidebarWidth;
  final void Function(double delta) onSidebarResized;

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
            AdminSidebar(width: sidebarWidth),

            /// 2. Drag Handle
            GestureDetector(
              behavior: .translucent,
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                onSidebarResized(details.delta.dx);
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
                child: const Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    /// Toolbar
                    AdminToolbar(),

                    /// Screen Content
                    Expanded(child: AdminMainContentArea())
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
