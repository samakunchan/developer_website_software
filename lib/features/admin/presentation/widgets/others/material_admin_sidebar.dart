import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/material.dart';

class MaterialAdminSidebar extends StatelessWidget {
  const MaterialAdminSidebar({required this.selectedNavIndex, required this.navItems, this.width, super.key, this.onSelectMenu});

  final double? width;
  final int selectedNavIndex;
  final List<Map<String, dynamic>> navItems;
  final ValueChanged<int>? onSelectMenu;

  @override
  Widget build(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;

    final Color primaryColor = theme.colorScheme.primary;
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
                      Icon(Icons.terminal, size: 24, color: primaryColor),
                      Text('PapangueSoft', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: .bold))
                    ]
                  ),
                  const SizedBox(height: 4),
                  Text('V 0.4.0 - Dev', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey))
                ]
              )
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
                        border: isSelected ? Border(right: BorderSide(color: primaryColor, width: 2.5)) : null
                      ),
                      child: Row(
                        spacing: 12,
                        children: [
                          Icon(item['icon'] as IconData, size: 18, color: isSelected ? primaryColor : sidebarLinkColor),
                          Text(
                            item['label'] as String,
                            style: TextStyle(
                              fontWeight: isSelected ? .bold : .w500,
                              color: isSelected ? primaryColor : sidebarLinkColor
                            )
                          )
                        ]
                      )
                    )
                  );
                }
              )
            ),

            /// Footer (Logout)
            Padding(
              padding: const .all(16),
              child: ElevatedButton(
                onPressed: authSignals.signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: textContrastColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: .circular(8))
                ),
                child: const Text('Logout', style: TextStyle(fontWeight: .bold))
              )
            )
          ]
        )
      )
    );
  }
}
