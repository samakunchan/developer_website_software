import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/viewmodels/theme_view_model.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/windows/components/fluent_theme_option_card.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentThemeSelectorGrid extends StatelessWidget {
  const FluentThemeSelectorGrid({
    required this.currentThemeSignal,
    required this.isLoadingSignal,
    required this.onThemeSelected,
    super.key
  });

  final Signal<ThemeViewModel> currentThemeSignal;
  final Signal<bool> isLoadingSignal;
  final ValueChanged<String> onThemeSelected;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    // Group themes by category
    final Map<String, List<ThemeOption>> groupedThemes = {};
    for (final ThemeOption item in SettingsAppSignals.themes) {
      groupedThemes.putIfAbsent(item.category, () => []).add(item);
    }

    // Sort categories (Default category first, then alphabetical)
    final List<String> sortedCategories = groupedThemes.keys.toList()
      ..sort((String a, String b) {
        if (a == 'Défaut') return -1;
        if (b == 'Défaut') return 1;
        return a.compareTo(b);
      });

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          spacing: 24,
          children: sortedCategories.map((String category) {
            final List<ThemeOption> categoryThemes = groupedThemes[category]!;

            return Column(
              crossAxisAlignment: .start,
              spacing: 12,
              children: [
                /// Theme category title
                Text(category, style: theme.typography.bodyStrong?.copyWith(fontWeight: .bold)),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(categoryThemes.length, (int index) {
                    final ThemeOption option = categoryThemes[index];

                    return FluentThemeOptionCard(
                      option: option,
                      currentThemeSignal: currentThemeSignal,
                      isLoadingSignal: isLoadingSignal,
                      onTap: () => onThemeSelected(option.id)
                    );
                  }),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
