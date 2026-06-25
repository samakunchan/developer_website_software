import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/admin/presentation/signals/admin_signals.dart';
import 'package:developer_website_software/features/admin/presentation/viewmodels/admin_nav_item.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_badge_count.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:developer_website_software/features/themes/widgets/cupertino_app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoAdminSidebar extends StatelessWidget {
  const CupertinoAdminSidebar({this.width, super.key});

  final double? width;

  @override
  Widget build(BuildContext context) {
    final PackageInfo packageInfo = kGetIt<PackageInfo>();
    final AdminSignals signals = kGetIt<AdminSignals>();

    return SizedBox(
      width: width,
      child: ColoredBox(
        color: kSidebarBackgroundColor,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            /// Header
            Padding(
              padding: const .all(16),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 4,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      const Icon(CupertinoIcons.desktopcomputer, color: kPrimaryColor),
                      Text('PapangueSoft', style: CupertinoTheme.of(context).textTheme.navTitleTextStyle),
                    ],
                  ),
                  Text('V ${packageInfo.version} - Dev', style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle),
                ],
              ),
            ),

            /// Navigation Items
            Expanded(
              child: SignalBuilder(
                builder: (BuildContext context) {
                  final AdminPage currentPage = signals.currentPage.value;

                  return ListView.builder(
                    itemCount: AdminNavItem.macosNavItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final AdminNavItem item = AdminNavItem.macosNavItems[index];
                      final AdminPage page = item.page;
                      final bool isSelected = currentPage == page;

                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => signals.selectPage(page),
                          child: Container(
                            margin: const .symmetric(horizontal: 10, vertical: 4),
                            padding: const .symmetric(horizontal: 12, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? kGlassBgColor : CupertinoColors.transparent,
                              borderRadius: isSelected
                                  ? const .only(topRight: .circular(8), bottomRight: .circular(8))
                                  : .circular(0),
                              border: isSelected
                                  ? Border(right: BorderSide(color: CupertinoTheme.of(context).selectionHandleColor, width: 2.5))
                                  : null,
                            ),
                            child: Row(
                              spacing: 10,
                              children: [
                                Icon(
                                  item.icon,
                                  size: 18,
                                  color: isSelected ? null : CupertinoTheme.of(context).textTheme.actionTextStyle.color,
                                ),
                                if (index == AdminNavItem.macosNavItems.indexOf(AdminNavItem.macosMessages))
                                  Row(
                                    spacing: 10,
                                    children: [
                                      Text(
                                        item.label,
                                        style: isSelected
                                            ? CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(
                                                color: CupertinoTheme.of(context).selectionHandleColor,
                                              )
                                            : CupertinoTheme.of(context).textTheme.actionTextStyle,
                                      ),
                                      const CupertinoMessageBadgeCount(),
                                    ],
                                  )
                                else
                                  Text(
                                    item.label,
                                    style: isSelected
                                        ? CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(
                                            color: CupertinoTheme.of(context).selectionHandleColor,
                                          )
                                        : CupertinoTheme.of(context).textTheme.actionTextStyle,
                                  ),
                              ],
                            ),
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
              child: CupertinoAppButton(onPressed: kGetIt<AuthSignals>().signOut, child: const Text('Logout')),
            ),
          ],
        ),
      ),
    );
  }
}
