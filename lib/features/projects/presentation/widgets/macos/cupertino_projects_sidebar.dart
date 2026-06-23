import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoProjectsSidebar extends StatelessWidget {
  const CupertinoProjectsSidebar({required this.signals, super.key});

  final ProjectsSignals signals;

  static const List<Map<String, String>> _categories = [
    {'id': 'all', 'label': 'All Projects'},
    {'id': 'web', 'label': 'Web Apps'},
    {'id': 'mobile', 'label': 'Mobile UI'},
    {'id': 'open_source', 'label': 'Open Source'},
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Sidebar Header
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 24, bottom: 12),
            child: Text(
              'CATEGORIES',
              style: CupertinoTheme.of(context).textTheme.actionSmallTextStyle.copyWith(
                fontWeight: .bold,
                fontSize: 11,
                color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey2,
              ),
            ),
          ),

          /// Navigation List
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

                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => signals.activeFilter.value = catId,
                        child: Container(
                          margin: const .symmetric(horizontal: 10, vertical: 3),
                          padding: const .symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? kGlassBgColor : CupertinoColors.transparent,
                            borderRadius: .circular(8),
                          ),
                          child: Text(
                            label,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
