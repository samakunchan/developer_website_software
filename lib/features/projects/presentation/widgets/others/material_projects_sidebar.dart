import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialProjectsSidebar extends StatelessWidget {
  const MaterialProjectsSidebar({required this.signals, super.key});

  final ProjectsSignals signals;

  static const List<Map<String, String>> _categories = [
    {'id': 'all', 'label': 'All Projects'},
    {'id': 'web', 'label': 'Web Apps'},
    {'id': 'mobile', 'label': 'Mobile UI'},
    {'id': 'open_source', 'label': 'Open Source'},
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;

    final Color primaryColor = theme.colorScheme.primary;
    final Color sidebarBg = isDark ? DarkThemeConstants.background : LightThemeConstants.glassBg;
    const Color sidebarLinkColor = Color(0xFF94A3B8);
    final Color glassBg = isDark ? DarkThemeConstants.glassBg : LightThemeConstants.glassBg;

    return SizedBox(
      width: 220,
      child: ColoredBox(
        color: sidebarBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Title
            Padding(
              padding: const .only(left: 20, top: 24, bottom: 12),
              child: Text(
                'CATEGORIES',
                style: theme.textTheme.bodySmall?.copyWith(fontWeight: .bold, fontSize: 11, color: sidebarLinkColor),
              ),
            ),

            /// Section List
            Expanded(
              child: SignalBuilder(
                builder: (BuildContext context) {
                  final String activeFilter = signals.activeFilter.value;

                  return ListView.builder(
                    itemCount: _categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Map<String, String> cat = _categories[index];
                      final String catId = cat['id']!;
                      final String label = cat['label']!;
                      final bool isSelected = activeFilter == catId;

                      return GestureDetector(
                        onTap: () => signals.activeFilter.value = catId,
                        child: Container(
                          margin: const .symmetric(horizontal: 10, vertical: 3),
                          padding: const .symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? glassBg : Colors.transparent,
                            borderRadius: .circular(8),
                            border: isSelected ? Border(left: BorderSide(color: primaryColor, width: 2.5)) : null,
                          ),
                          child: Text(
                            label,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected ? .bold : .w500,
                              color: isSelected ? primaryColor : sidebarLinkColor,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
