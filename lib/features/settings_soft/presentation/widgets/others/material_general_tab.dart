import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_setting_row.dart';
import 'package:flutter/material.dart';

class MaterialGeneralTab extends StatelessWidget {
  const MaterialGeneralTab({required this.settings, super.key});
  final SettingsSoftSignals settings;

  @override
  Widget build(BuildContext context) {
    final ThemeMode currentTheme = settings.themeMode.value;
    final AppFontSize currentSize = settings.fontSize.value;
    final AppFontFamily currentFont = settings.fontFamily.value;

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // Theme setting
        MaterialSettingRow(
          label: 'Appearance',
          child: SegmentedButton<ThemeMode>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(value: ThemeMode.system, label: Text('System')),
              ButtonSegment(value: ThemeMode.light, label: Text('Light')),
              ButtonSegment(value: ThemeMode.dark, label: Text('Dark'))
            ],
            selected: {currentTheme},
            onSelectionChanged: (Set<ThemeMode> selection) {
              settings.setThemeMode(selection.first);
            }
          )
        ),
        const SizedBox(height: 16),

        // Font Size setting
        MaterialSettingRow(
          label: 'Font Size',
          child: SegmentedButton<AppFontSize>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(value: AppFontSize.small, label: Text(AppFontSize.small.value)),
              ButtonSegment(value: AppFontSize.medium, label: Text(AppFontSize.medium.value)),
              ButtonSegment(value: AppFontSize.large, label: Text(AppFontSize.large.value))
            ],
            selected: {currentSize},
            onSelectionChanged: (Set<AppFontSize> selection) {
              settings.setFontSize(selection.first);
            }
          )
        ),
        const SizedBox(height: 16),

        // Font Family setting
        MaterialSettingRow(
          label: 'Font Family',
          child: SegmentedButton<AppFontFamily>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(value: AppFontFamily.system, label: Text('System')),
              ButtonSegment(value: AppFontFamily.inter, label: Text('Inter'))
            ],
            selected: {currentFont},
            onSelectionChanged: (Set<AppFontFamily> selection) {
              settings.setFontFamily(selection.first);
            }
          )
        )
      ]
    );
  }
}
