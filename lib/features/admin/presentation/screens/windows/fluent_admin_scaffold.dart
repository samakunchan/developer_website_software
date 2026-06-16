import 'package:developer_website_software/features/admin/presentation/widgets/admin_main_content_area.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_sidebar.dart';
import 'package:developer_website_software/features/admin/presentation/widgets/admin_toolbar.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentAdminScaffold extends StatefulWidget {
  const FluentAdminScaffold({required this.sidebarWidth, required this.onSidebarResized, super.key});

  final double sidebarWidth;
  final void Function(double delta) onSidebarResized;

  @override
  State<FluentAdminScaffold> createState() => _FluentAdminScaffoldState();
}

class _FluentAdminScaffoldState extends State<FluentAdminScaffold> {
  int _selectedNavIndex = 0;

  final List<Map<String, dynamic>> _navItems = [
    {'label': 'Dashboard', 'icon': FluentIcons.view_dashboard},
    {'label': 'Messages', 'icon': FluentIcons.message},
    {'label': 'Profiles', 'icon': FluentIcons.contact},
    {'label': 'Projects', 'icon': FluentIcons.project_collection},
    {'label': 'Analytics', 'icon': FluentIcons.equalizer},
    {'label': 'Settings', 'icon': FluentIcons.settings},
  ];

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
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: ColoredBox(
                color: sidebarBorder,
                child: const SizedBox(width: 4, height: .infinity),
              ),
            ),
          ),

          /// 3. Main Content Area
          Expanded(
            child: ColoredBox(
              color: isDark ? const Color(0xFF272727) : const Color(0xFFFFFFFF),
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
    );
  }
}
