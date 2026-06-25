import 'package:developer_website_software/features/admin/presentation/widgets/admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_toolbar.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';

class CupertinoAdminScaffold extends StatelessWidget {
  const CupertinoAdminScaffold({required this.sidebarWidth, required this.onSidebarResized, super.key});

  final double sidebarWidth;
  final void Function(double delta) onSidebarResized;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return CupertinoPageScaffold(
      child: SafeArea(
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
              child: const MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: ColoredBox(
                  color: kSidebarBorderColor,
                  child: SizedBox(width: 4, height: .infinity)
                )
              )
            ),

            /// 3. Main Content Area
            Expanded(
              child: ColoredBox(
                color: isDark ? kScaffoldBackgroundColor : CupertinoColors.systemBackground,
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
