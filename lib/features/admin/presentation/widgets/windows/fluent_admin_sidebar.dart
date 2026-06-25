import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/core/extensions/build_context_extension.dart';
import 'package:developer_website_software/features/admin/presentation/signals/admin_signals.dart';
import 'package:developer_website_software/features/admin/presentation/viewmodels/admin_nav_item.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_badge_count.dart';
import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentAdminSidebar extends StatelessWidget {
  const FluentAdminSidebar({this.width, super.key});

  final double? width;

  @override
  Widget build(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final AdminSignals signals = kGetIt<AdminSignals>();
    final PackageInfo packageInfo = kGetIt<PackageInfo>();
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;

    final Color primaryColor = theme.accentColor;
    final Color sidebarBg = isDark ? DarkThemeConstants.background : LightThemeConstants.glassBg;
    const Color sidebarLinkColor = Color(0xFF94A3B8);
    final Color glassBg = isDark ? DarkThemeConstants.glassBg : LightThemeConstants.glassBg;
    final Color textContrastColor = isDark ? LightThemeConstants.text : DarkThemeConstants.text;

    String getLabel(AdminPage page) {
      switch (page) {
        case AdminPage.dashboard:
          return context.localizations.dashboard;
        case AdminPage.messages:
          return context.localizations.messages;
        case AdminPage.profiles:
          return context.localizations.profiles;
        case AdminPage.projects:
          return context.localizations.projects;
        case AdminPage.analytics:
          return context.localizations.analytics;
        case AdminPage.settings:
          return context.localizations.settings;
      }
    }

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
                  Text('V ${packageInfo.version} - Dev', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
            ),

            /// Navigation Items
            Expanded(
              child: SignalBuilder(
                builder: (BuildContext context) {
                  final AdminPage currentPage = signals.currentPage.value;

                  return ListView.builder(
                    itemCount: AdminNavItem.windowsNavItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final AdminNavItem item = AdminNavItem.windowsNavItems[index];
                      final AdminPage page = item.page;
                      final bool isSelected = currentPage == page;

                      return GestureDetector(
                        onTap: () => signals.selectPage(page),
                        child: Container(
                          margin: const .only(left: 10, top: 4, bottom: 4),
                          padding: const .symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? glassBg : Colors.transparent,
                            borderRadius: isSelected
                                ? const .only(topLeft: .circular(8), bottomLeft: .circular(8))
                                : .circular(8),
                            border: isSelected ? Border(right: BorderSide(color: primaryColor, width: 2.5)) : null,
                          ),
                          child: Row(
                            spacing: 12,
                            children: [
                              Icon(item.icon, size: 16, color: isSelected ? primaryColor : sidebarLinkColor),
                              if (index == AdminNavItem.windowsNavItems.indexOf(AdminNavItem.windowsMessages))
                                Row(
                                  spacing: 10,
                                  children: [
                                    Text(
                                      getLabel(page),
                                      style: TextStyle(
                                        fontWeight: isSelected ? .bold : .w500,
                                        color: isSelected ? primaryColor : sidebarLinkColor,
                                      ),
                                    ),
                                    const FluentMessageBadgeCount(isSelected: false),
                                  ],
                                )
                              else
                                Text(
                                  getLabel(page),
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
                      context.localizations.logout,
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
