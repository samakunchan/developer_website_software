import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSettingsSidebar extends StatelessWidget {
  const CupertinoSettingsSidebar({
    required this.selectedSectionIndex,
    required this.sections,
    required this.onSelectSection,
    super.key,
  });

  final int selectedSectionIndex;
  final List<String> sections;
  final ValueChanged<int> onSelectSection;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          /// Title
          Padding(
            padding: const .only(left: 20, top: 24, bottom: 12),
            child: Text(
              'SITE SETTINGS',
              style: CupertinoTheme.of(context).textTheme.actionSmallTextStyle.copyWith(
                fontWeight: .bold,
                fontSize: 11,
                color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey2,
              ),
            ),
          ),

          /// Section List
          Expanded(
            child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (BuildContext context, int index) {
                final String section = sections[index];
                final bool isSelected = selectedSectionIndex == index;

                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => onSelectSection(index),
                    child: Container(
                      margin: const .symmetric(horizontal: 10, vertical: 3),
                      padding: const .symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? kGlassBgColor : CupertinoColors.transparent,
                        borderRadius: .circular(8),
                      ),
                      child: Text(
                        section,
                        style: isSelected
                            ? CupertinoTheme.of(context).textTheme.actionSmallTextStyle.copyWith(
                                color: CupertinoTheme.of(context).selectionHandleColor,
                                fontWeight: .bold,
                              )
                            : CupertinoTheme.of(context).textTheme.actionSmallTextStyle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
