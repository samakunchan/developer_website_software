import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentAdminSidebar extends StatelessWidget {
  const FluentAdminSidebar({required this.selectedNavIndex, required this.navItems, this.width, super.key, this.onSelectMenu});

  final double? width;
  final int selectedNavIndex;
  final List<Map<String, dynamic>> navItems;
  final ValueChanged<int>? onSelectMenu;

  @override
  Widget build(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;

    final Color primaryColor = theme.accentColor;
    final Color sidebarBg = isDark ? DarkThemeConstants.background : LightThemeConstants.glassBg;
    const Color sidebarLinkColor = Color(0xFF94A3B8);
    final Color glassBg = isDark ? DarkThemeConstants.glassBg : LightThemeConstants.glassBg;
    final Color textContrastColor = isDark ? LightThemeConstants.text : DarkThemeConstants.text;

    return SizedBox(
      width: width,
      child: ColoredBox(
        color: sidebarBg,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            /// Header
            Padding(
              padding: const .all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Icon(FluentIcons.command_prompt, size: 20, color: primaryColor),
                      Text(
                        'PapangueSoft',
                        style: TextStyle(fontSize: 16, fontWeight: .bold, color: isDark ? Colors.white : Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('V 0.5.0 - Dev', style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
            ),

            /// Navigation Items
            Expanded(
              child: ListView.builder(
                itemCount: navItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> item = navItems[index];
                  final bool isSelected = selectedNavIndex == index;

                  return GestureDetector(
                    onTap: onSelectMenu != null ? () => onSelectMenu!(index) : null,
                    child: Container(
                      margin: const .only(left: 10, top: 4, bottom: 4),
                      padding: const .symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? glassBg : Colors.transparent,
                        borderRadius: isSelected ? const .only(topLeft: .circular(8), bottomLeft: .circular(8)) : .circular(8),
                        border: isSelected ? Border(right: BorderSide(color: primaryColor, width: 2.5)) : null,
                      ),
                      child: Row(
                        spacing: 12,
                        children: [
                          Icon(item['icon'] as IconData, size: 16, color: isSelected ? primaryColor : sidebarLinkColor),
                          Text(
                            item['label'] as String,
                            style: TextStyle(
                              fontWeight: isSelected ? .bold : .w500,
                              color: isSelected ? primaryColor : sidebarLinkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            /// Footer (Logout)
            Padding(
              padding: const .all(16),
              child: GestureDetector(
                onTap: authSignals.signOut,
                child: Container(
                  padding: const .symmetric(vertical: 10),
                  decoration: BoxDecoration(color: primaryColor, borderRadius: .circular(8)),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: textContrastColor, fontWeight: .bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
