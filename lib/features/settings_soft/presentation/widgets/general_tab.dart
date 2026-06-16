import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/setting_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ThemeMode;

class GeneralTab extends StatelessWidget {
  const GeneralTab({required this.settings, super.key});
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
        SettingRow(
          label: 'Appearance',
          child: CupertinoSlidingSegmentedControl<ThemeMode>(
            groupValue: currentTheme,
            children: const {
              ThemeMode.system: Padding(padding: .symmetric(horizontal: 8, vertical: 4), child: Text('System')),
              ThemeMode.light: Padding(padding: .symmetric(horizontal: 8, vertical: 4), child: Text('Light')),
              ThemeMode.dark: Padding(padding: .symmetric(horizontal: 8, vertical: 4), child: Text('Dark')),
            },
            onValueChanged: (ThemeMode? val) {
              if (val != null) {
                settings.setThemeMode(val);
              }
            },
          ),
        ),
        const SizedBox(height: 16),

        // Font Size setting
        SettingRow(
          label: 'Font Size',
          child: CupertinoSlidingSegmentedControl<AppFontSize>(
            groupValue: currentSize,
            children: {
              AppFontSize.small: Padding(
                padding: const .symmetric(horizontal: 8, vertical: 4),
                child: Text(AppFontSize.small.value),
              ),
              AppFontSize.medium: Padding(
                padding: const .symmetric(horizontal: 8, vertical: 4),
                child: Text(AppFontSize.medium.value),
              ),
              AppFontSize.large: Padding(
                padding: const .symmetric(horizontal: 8, vertical: 4),
                child: Text(AppFontSize.large.value),
              ),
            },
            onValueChanged: (AppFontSize? val) {
              if (val != null) {
                settings.setFontSize(val);
              }
            },
          ),
        ),
        const SizedBox(height: 16),

        // Font Family setting
        SettingRow(
          label: 'Font Family',
          child: CupertinoSlidingSegmentedControl<AppFontFamily>(
            groupValue: currentFont,
            children: const {
              AppFontFamily.system: Padding(padding: .symmetric(horizontal: 12, vertical: 4), child: Text('System')),
              AppFontFamily.inter: Padding(padding: .symmetric(horizontal: 12, vertical: 4), child: Text('Inter')),
            },
            onValueChanged: (AppFontFamily? val) {
              if (val != null) {
                settings.setFontFamily(val);
              }
            },
          ),
        ),
      ],
    );
  }
}
