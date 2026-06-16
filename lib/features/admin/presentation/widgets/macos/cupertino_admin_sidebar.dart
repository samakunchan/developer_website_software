import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:developer_website_software/features/themes/widgets/cupertino_app_button.dart';
import 'package:flutter/cupertino.dart';

class CupertinoAdminSidebar extends StatelessWidget {
  const CupertinoAdminSidebar({required this.selectedNavIndex, required this.navItems, this.width, super.key, this.onSelectMenu});

  final double? width;
  final int selectedNavIndex;
  final List<Map<String, dynamic>> navItems;
  final ValueChanged<int>? onSelectMenu;

  @override
  Widget build(BuildContext context) {
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
                      Text('PapangueSoft', style: CupertinoTheme.of(context).textTheme.navTitleTextStyle)
                    ]
                  ),
                  Text('V 0.4.0 - Dev', style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle)
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

                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: onSelectMenu != null ? () => onSelectMenu!(index) : null,
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
                              : null
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Icon(
                              item['icon'] as IconData,
                              size: 18,
                              color: isSelected ? null : CupertinoTheme.of(context).textTheme.actionTextStyle.color
                            ),
                            Text(
                              item['label'] as String,
                              style: isSelected
                                  ? CupertinoTheme.of(
                                      context
                                    ).textTheme.actionTextStyle.copyWith(color: CupertinoTheme.of(context).selectionHandleColor)
                                  : CupertinoTheme.of(context).textTheme.actionTextStyle
                            )
                          ]
                        )
                      )
                    )
                  );
                }
              )
            ),

            /// Footer (Logout)
            Padding(
              padding: const .all(16),
              child: CupertinoAppButton(textButton: 'Logout', onPressed: kGetIt<AuthSignals>().signOut)
            )
          ]
        )
      )
    );
  }
}
