import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentSettingsSidebar extends StatelessWidget {
  const FluentSettingsSidebar({
    required this.selectedSectionIndex,
    required this.sections,
    required this.onSelectSection,
    super.key
  });

  final int selectedSectionIndex;
  final List<String> sections;
  final ValueChanged<int> onSelectSection;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;

    final Color primaryColor = theme.accentColor;
    final Color sidebarBg = isDark ? DarkThemeConstants.background : LightThemeConstants.glassBg;
    const Color sidebarLinkColor = Color(0xFF94A3B8);
    final Color glassBg = isDark ? DarkThemeConstants.glassBg : LightThemeConstants.glassBg;

    return SizedBox(
      width: 220,
      child: ColoredBox(
        color: sidebarBg,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            /// Title
            const Padding(
              padding: .only(left: 20, top: 24, bottom: 12),
              child: Text(
                'SITE SETTINGS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: Color(0xFF94A3B8)
                )
              )
            ),

            /// Section List
            Expanded(
              child: ListView.builder(
                itemCount: sections.length,
                itemBuilder: (BuildContext context, int index) {
                  final String section = sections[index];
                  final bool isSelected = selectedSectionIndex == index;

                  return GestureDetector(
                    onTap: () => onSelectSection(index),
                    child: Container(
                      margin: const .symmetric(horizontal: 10, vertical: 3),
                      padding: const .symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? glassBg : Colors.transparent,
                        borderRadius: .circular(8),
                        border: isSelected ? Border(right: BorderSide(color: primaryColor, width: 2.5)) : null
                      ),
                      child: Text(
                        section,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isSelected ? .bold : .w500,
                          color: isSelected ? primaryColor : sidebarLinkColor
                        )
                      )
                    )
                  );
                }
              )
            )
          ]
        )
      )
    );
  }
}
