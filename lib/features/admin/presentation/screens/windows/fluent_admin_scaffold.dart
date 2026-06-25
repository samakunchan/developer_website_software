import 'package:developer_website_software/features/admin/presentation/widgets/admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_toolbar.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentAdminScaffold extends StatelessWidget {
  const FluentAdminScaffold({required this.sidebarWidth, required this.onSidebarResized, super.key});

  final double sidebarWidth;
  final void Function(double delta) onSidebarResized;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;

    final Color sidebarBorder = isDark ? const Color(0xFF1E293B) : LightThemeConstants.glassBorder;

    return ScaffoldPage(
      padding: .zero,
      content: Row(
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
              color: isDark ? const Color(0xFF272727) : const Color(0xFFFFFFFF),
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
    );
  }
}
