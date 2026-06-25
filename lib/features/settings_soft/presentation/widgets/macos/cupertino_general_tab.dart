import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_setting_row.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_settings_soft_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoGeneralTab extends StatelessWidget {
  const CupertinoGeneralTab({required this.settings, super.key});
  final SettingsSoftSignals settings;

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (BuildContext context) {
        final ThemeMode currentTheme = settings.themeMode.value;
        final AppFontSize currentSize = settings.fontSize.value;
        final AppFontFamily currentFont = settings.fontFamily.value;

        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CupertinoSettingRow(
              label: 'Appearance',
              child: CupertinoSlidingSegmentedControl<ThemeMode>(
                groupValue: currentTheme,
                padding: const .all(4),
                children: const {
                  ThemeMode.system: Padding(
                    padding: .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text('System')
                  ),
                  ThemeMode.light: Padding(
                    padding: .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text('Light')
                  ),
                  ThemeMode.dark: Padding(
                    padding: .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text('Dark')
                  )
                },
                onValueChanged: (ThemeMode? val) {
                  if (val != null) {
                    settings.setThemeMode(val);
                  }
                }
              )
            ),
            const SizedBox(height: 16),
            CupertinoSettingRow(
              label: 'Font Size',
              child: CupertinoSlidingSegmentedControl<AppFontSize>(
                groupValue: currentSize,
                padding: const .all(4),
                children: {
                  AppFontSize.small: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(AppFontSize.small.value)
                  ),
                  AppFontSize.medium: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(AppFontSize.medium.value)
                  ),
                  AppFontSize.large: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(AppFontSize.large.value)
                  )
                },
                onValueChanged: (AppFontSize? val) {
                  if (val != null) {
                    settings.setFontSize(val);
                  }
                }
              )
            ),
            const SizedBox(height: 16),
            CupertinoSettingRow(
              label: 'Font Family',
              child: CupertinoSlidingSegmentedControl<AppFontFamily>(
                groupValue: currentFont,
                padding: const .all(4),
                children: const {
                  AppFontFamily.system: Padding(
                    padding: .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text('System')
                  ),
                  AppFontFamily.inter: Padding(
                    padding: .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text('Inter')
                  )
                },
                onValueChanged: (AppFontFamily? val) {
                  if (val != null) {
                    settings.setFontFamily(val);
                  }
                }
              )
            )
          ]
        );
      }
    );
  }
}
